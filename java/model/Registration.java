package model;

import java.sql.*;
import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class Registration {

	private Connection con;
	HttpSession se;

	public Registration(HttpSession session) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // Load the drivers
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_management", "root", "tiger");
			// Connection with database
			se = session;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String register(String name, String phone, String email, String pin) {
		PreparedStatement ps;
		String status = "";
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM users WHERE phone='" + phone + "' OR email='" + email + "';");
			boolean exists = rs.next();

			if (exists) {
				status = "existed";
			} else {
				ps = con.prepareStatement(
						"INSERT INTO users (name, phone, email, pin, date) VALUES (?, ?, ?, ?, NOW())");
				ps.setString(1, name);
				ps.setString(2, phone);
				ps.setString(3, email);
				ps.setString(4, Encryption.encrypt(pin));
				int result = ps.executeUpdate();
				if (result > 0) {
					status = "success";
				} else {
					status = "failure";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public String login(String email, String pin) {
		String status = "";
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(
					"SELECT * FROM users WHERE email='" + email + "' AND pin='" + Encryption.encrypt(pin) + "';");
			boolean exists = rs.next();

			if (exists) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				se.setAttribute("uname", name);
				se.setAttribute("email", email);
				se.setAttribute("id", id);
				status = "success";
			} else {
				status = "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public User getInfo() {
		Statement st = null;
		ResultSet rs = null;
		User s = null;
		try {
			st = con.createStatement();
			rs = st.executeQuery("select * from users where id= '" + se.getAttribute("id") + "'");
			boolean b = rs.next();
			if (b == true) {
				s = new User();
				s.setName(rs.getString("name"));
				s.setPhoneNumber(rs.getString("phone"));
				s.setEmail(rs.getString("email"));
			} else {
				s = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return s;
	}

	public String update(String name, String pno, String email) {
		String status = "";
		Statement st = null;
		ResultSet rs = null;
		try {
			st = con.createStatement();
			st.executeUpdate("update users set name='" + name + "',phone='" + pno + "',email='" + email
					+ "' where id= '" + se.getAttribute("id") + "' ");
			se.setAttribute("uname", name);
			se.setAttribute("email", email);
			status = "success";
		} catch (Exception e) {
			status = "failure";
			e.printStackTrace();
		}

		return status;
	}

	public ArrayList<User> getUserInfo(String id) {
		Statement st = null;
		ResultSet rs = null;
		ArrayList<User> al = new ArrayList<User>();
		try {
			st = con.createStatement();
			String qry = "select * from users where id = '" + id + "';";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				User p = new User();
				p.setId(rs.getString("id"));
				p.setName(rs.getString("name"));
				p.setEmail(rs.getString("email"));
				p.setPhoneNumber(rs.getString("phone"));
				p.setDate(rs.getString("date"));
				al.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public ArrayList<User> getUserDetails() {
		Statement st;
		ResultSet rs;
		ArrayList<User> al = new ArrayList<User>();
		try {
			st = con.createStatement();
			String qry = "select *," + "date_format(date,'%b %d, %Y') as date1" + " from users where id not in(1);";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				User p = new User();
				p.setId(rs.getString("id"));
				p.setName(rs.getString("name"));
				p.setEmail(rs.getString("email"));
				p.setPhoneNumber(rs.getString("phone"));
				p.setDate(rs.getString("date1"));
				al.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public String delete(int id) {
		int count = 0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("delete from users where " + "id='" + id + "'");
			if (count > 0) {
				status = "success";
			} else {
				status = "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public String ForgotPassword(String mail, String pw) {
		String status = "";
		try {
			Statement st = con.createStatement();

			int rspw = st
					.executeUpdate("update users set pin='" + Encryption.encrypt(pw) + "' where email='" + mail + "';");
			if (rspw > 0) {
				status = "success";
			} else {
				status = "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public String getPassword(String email, String oldPass) {
		// TODO Auto-generated method stub
		String status = "";
		PreparedStatement ps = null;
		ResultSet rs = null;
		String query = "select * from users where email=? and pin=?";
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, Encryption.encrypt(oldPass));
			rs = ps.executeQuery();
			if (rs.next()) {
				// se.setAttribute("pwd", rs.getString(5));
				status = "success";
			} else {
				status = "failed";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// System.out.println(status);
		return status;
	}

	public String resetPassword(String email, String pwd) {
//TODO Auto-generated method stub
		String status = "";
		PreparedStatement ps = null;
		boolean res;
		try {
			ps = con.prepareStatement("update users set pin =  ? where  email =  ?");
			ps.setString(1, Encryption.encrypt(pwd));
			ps.setString(2, email);
			int rc = ps.executeUpdate();
			if (rc > 0) {
				status = "success";
			} else {
				status = "failed";
			}
		} catch (SQLException e) {
//TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}

	public String addEvent(String img, String name, String cost, String details, String category) {
		PreparedStatement ps;
		String status = "";
		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			rs = st.executeQuery("select * from events where event_name='" + name + "';");
			boolean b = rs.next();
			if (b)
				status = "Already Added";
			else {
				ps = (PreparedStatement) con.prepareStatement("insert into events values (0,?,?,?,?,?,now())");
				ps.setString(1, img);
				ps.setString(2, name);
				ps.setString(3, cost);
				ps.setString(4, details);
				ps.setString(5, category);
				int a = ps.executeUpdate();
				if (a > 0)
					status = "Submitted";
				else
					status = "Failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public String delEvent(String event,String category) {
		int count = 0;
		Statement st = null;
		String status = "";
		try {
			st = con.createStatement();
			count = st.executeUpdate("delete from events where " + "event_category='" + category + "' and event_name='"+event+"'");
			if (count > 0) {
				status = "success";
			} else {
				status = "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	

	public ArrayList<Dproduct> get_eventinfo(String event_category) {
		ArrayList<Dproduct> al = new ArrayList<Dproduct>();
		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			String qry = " select * from events where event_category='" + event_category + "';";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Dproduct d = new Dproduct();
				d.setP_id(rs.getString("event_id")); // 1..r---db 2.. pass the data or value to Dproduct class set
														// method
				d.setP_image(rs.getString("event_img"));
				d.setP_name(rs.getString("event_name"));
				d.setP_cost(rs.getString("event_cost"));
				d.setP_details(rs.getString("event_details"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	public Dproduct getEventFormInfo(String event_id) {
		Statement st = null;
		ResultSet rs = null;
		Dproduct s = null;
		try {
			st = con.createStatement();
			rs = st.executeQuery("select * from events where event_id= '" + event_id + "'");
			boolean b = rs.next();
			if (b == true) {
				s = new Dproduct();
				s.setP_name(rs.getString("event_name"));
				s.setP_cost(rs.getString("event_cost"));
				s.setP_image(rs.getString("event_img"));
			} else {
				s = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return s;
	}
	public String Booknow(HttpServletRequest request) {
		String status = "";
		ResultSet rs = null;
		try {
			Statement st = con.createStatement();
			rs = st.executeQuery(
					"select event_id from bookevent where eventdate= '" + request.getParameter("edate") + "'");
			boolean b = rs.next();
			if (b == true) {
				status = "existed";
			} else {
				String qry = "insert into bookevent select 0,event_img,event_name,'" + request.getParameter("email")
						+ "', '" + request.getParameter("address") + "',event_cost,'" + se.getAttribute("uname") + "',"
						+ se.getAttribute("id") + " ,'pending',now(),'" + request.getParameter("edate")
						+ "' from events where event_id=" + request.getParameter("event_id") + ";";
				int a = st.executeUpdate(qry);
				if (a > 0) {
					status = "success";
				} else {
					status = "failure";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public ArrayList<Dproduct> geteventstatus() {
		ArrayList<Dproduct> al = new ArrayList<Dproduct>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select *,date_format(date,'%d %b,%Y') as date1,date_format(eventdate,'%d %b,%Y') as date2 from bookevent where uid='"
					+ se.getAttribute("id") + " ';";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Dproduct d = new Dproduct(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				d.setP_id(rs.getString("event_id"));
				d.setP_image(rs.getString("event_img"));
				d.setP_name(rs.getString("event_name"));
				d.setP_cost(rs.getString("event_cost"));
				d.setEmail(rs.getString("email"));
				d.setDate(rs.getString("date1"));
				d.setEventdate(rs.getString("date2"));
				d.setStatus(rs.getString("status"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	
	public int deleteevent(int event_id) {
		int status = 0;
		try {
			Statement st = null;
			st = con.createStatement();
			String qry = "update bookevent set status='cancelled' where event_id=' " + event_id + "' ";
			status = st.executeUpdate(qry);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public int acceptevent(int event_id) {
		int status = 0;
		try {
			Statement st = null;
			st = con.createStatement();
			String qry = "update bookevent set status='booked' where event_id=' " + event_id + "' ";
			status = st.executeUpdate(qry);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public ArrayList<Dproduct> geteventstatusAdmin() {
		ArrayList<Dproduct> al = new ArrayList<Dproduct>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select *,date_format(date,'%d %b,%Y') as date1,date_format(eventdate,'%d %b,%Y') as date2 from bookevent;";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Dproduct d = new Dproduct(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				d.setP_id(rs.getString("event_id"));
				d.setP_image(rs.getString("event_img"));
				d.setP_name(rs.getString("event_name"));
				d.setP_cost(rs.getString("event_cost"));
				d.setEmail(rs.getString("email"));
				d.setDate(rs.getString("date1"));
				d.setEventdate(rs.getString("date2"));
				d.setStatus(rs.getString("status"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	
	public ArrayList<User> getClients() {
		ArrayList<User> al = new ArrayList<User>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select *,date_format(date,'%d %b,%Y') as date1 from customer;";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				User d = new User(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				d.setId(rs.getString("cid"));
				d.setName(rs.getString("cname"));
				d.setEmail(rs.getString("cemail"));
				d.setDate(rs.getString("date"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	
	public String review(String name, String email, String rating, String opinion) {

		PreparedStatement ps;
		String status = "";
		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			ps = (PreparedStatement) con.prepareStatement("insert into review values (0,?,?,?,?,now())");
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, rating);
			ps.setString(4, opinion);
			int a = ps.executeUpdate();
			if (a > 0)
				status = "Successful";
			else
				status = "Failed";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public ArrayList<Ratings> getFeedbackList() {
		ArrayList<Ratings> al = new ArrayList<Ratings>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select *,date_format(date,'%d %b,%Y') as date1 from review;";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Ratings d = new Ratings(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				d.setRid(rs.getString("review_id"));
				d.setUname(rs.getString("uname"));
				d.setEmail(rs.getString("email"));
				d.setRating(rs.getString("rating"));
				d.setMessage(rs.getString("message"));
				d.setDate(rs.getString("date"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	public String enquiry(String name, String email, String enquiry) {

		PreparedStatement ps;
		String status = "";
		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			ps = (PreparedStatement) con.prepareStatement("insert into enquiry values (0,?,?,?,?,now());");
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, enquiry);
			ps.setString(4, "Response:");
			int a = ps.executeUpdate();
			if (a > 0)
				status = "Successful";
			else
				status = "Failed";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	} 
	public ArrayList<EnqList> getEnquiryList() {
		ArrayList<EnqList> al = new ArrayList<EnqList>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select *,date_format(date,'%d %b,%Y') as date1 from enquiry;";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				EnqList d = new EnqList(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				d.setE_id(rs.getString("enquiry_id"));
				d.setU_name(rs.getString("uname"));
				d.setU_email(rs.getString("email"));
				d.setU_enq(rs.getString("u_enquiry"));
				d.setA_resp(rs.getString("a_response"));
				d.setDate(rs.getString("date"));
				al.add(d);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	public int delEnquiry(int enquiry_id) {
		int status = 0;
		try {
			Statement st = null;
			st = con.createStatement();
			String qry = "delete from enquiry where enquiry_id="+enquiry_id+";";
			status = st.executeUpdate(qry);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public EnqList getEnquiryInfo(String enquiry_id) {
		Statement st = null;
		ResultSet rs = null;
		EnqList s = null;
		try {
			st = con.createStatement();
			rs = st.executeQuery("select * from enquiry where enquiry_id= '" + enquiry_id + "'");
			boolean b = rs.next();
			if (b == true) {
				s = new EnqList();
				s.setE_id(rs.getString("enquiry_id"));
				s.setU_name(rs.getString("uname"));
				s.setU_email(rs.getString("email"));
				s.setU_enq(rs.getString("u_enquiry"));
			} else {
				s = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return s;
	}
	public void getOutSafeMode() {
		int status = 0;
		try {
			Statement st = null;
			st = con.createStatement();
			String qry = "SET SQL_SAFE_UPDATES = 0; ";
			status = st.executeUpdate(qry);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void setCurrentDateStatus() {
		int status = 0;
		try {
			Statement st = null;
			st = con.createStatement();
			String qry =" UPDATE bookevent SET status = 'Completed' WHERE (DATEDIFF(DATE_FORMAT(CURDATE(), '%Y-%m-%d'), eventdate) >= 1) and (status='booked'); ";
			status = st.executeUpdate(qry);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void deletePendingEvents() {
		int status = 0;
		try {
			Statement st = null;
			st = con.createStatement();
			String qry = "DELETE FROM bookevent WHERE status = 'Pending' AND eventdate < CURDATE();";
			status = st.executeUpdate(qry);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void getInSafeMode() {
		int status = 0;
		try {
			Statement st = null;
			st = con.createStatement();
			String qry = "SET SQL_SAFE_UPDATES = 1; ";
			status = st.executeUpdate(qry);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	

}
