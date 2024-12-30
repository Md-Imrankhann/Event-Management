package controller;

import java.io.IOException;

import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Registration;
import model.User;

@WebServlet(name = "register", urlPatterns = { "/register" })
public class RegisterServlet extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		// type of the response sent to the client or browser

		HttpSession session = request.getSession();
		Registration reg = new Registration(session);
		try {
			if (request.getParameter("register") != null) {

				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				String pw = request.getParameter("pw");
				String cp = request.getParameter("cp");

				if (pw.equals(cp)) {
					String status = reg.register(name, phone, email, pw);

					if (status.equals("existed")) {

						request.setAttribute("status", "Record Exists");
						RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
						rd1.forward(request, response);

					} else if (status.equals("success")) {
						request.setAttribute("status", "Successfully Registered");
						RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
						rd1.forward(request, response);

					} else if (status.equals("failure")) {
						request.setAttribute("status", "Registration failed");
						RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
						rd1.forward(request, response);

					}
				}
			} else if (request.getParameter("login") != null) {
				String email = request.getParameter("email");
				String pass = request.getParameter("pw");
				String status = reg.login(email, pass);
				if (status.equals("success")) {

					RequestDispatcher rd1 = request.getRequestDispatcher("home.jsp");

					rd1.forward(request, response);

				} else if (status.equals("failure")) {
					request.setAttribute("status", "Login failed");
					RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
					rd1.forward(request, response);
				}
			} else if (request.getParameter("logout") != null) {
				session.invalidate();
				RequestDispatcher rd1 = request.getRequestDispatcher("home.jsp");
				rd1.forward(request, response);
			} else if (session.getAttribute("uname") != null && request.getParameter("updateProfile") != null) {
				String name = request.getParameter("name");
				String pno = request.getParameter("phone");
				String email = request.getParameter("email");
				Registration u = new Registration(session);
				String status = u.update(name, pno, email);
				if (status.equals("success")) {
					request.setAttribute("status", "Profile successfully Updated");
					RequestDispatcher rd1 = request.getRequestDispatcher("EditForm.jsp");
					rd1.forward(request, response);
				} else {
					request.setAttribute("status", "Updation failure");
					RequestDispatcher rd1 = request.getRequestDispatcher("EditForm.jsp");
					rd1.forward(request, response);
				}
			} else if (request.getParameter("forgotPass") != null) {
				String mail = request.getParameter("email");
				String pw = request.getParameter("pw");
				String cp = request.getParameter("cw");
				if (pw.equals(cp)) {
					String status = reg.ForgotPassword(mail, pw);
					if (status.equals("success")) {
						request.setAttribute("status", "Password Reset Successfully");
						RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
						rd.forward(request, response);
					} else if (status.equals("failure")) {
						request.setAttribute("status", "Password Reset Failed");
						RequestDispatcher rd = request.getRequestDispatcher("forgot.jsp");
						rd.forward(request, response);
					}
				} else {
					request.setAttribute("status", "Password mismatch");
					RequestDispatcher rd = request.getRequestDispatcher("forgot.jsp");
					rd.forward(request, response);
				}

			} else if (request.getParameter("reset") != null) {
				String email = request.getParameter("email");
				String opw = request.getParameter("opw");
				String npw = request.getParameter("npw");
				String s = reg.getPassword(email, opw);
				if (opw.equals(npw)) {

					// System.out.println("Hi");
					if (s.equals("success") && (opw.equals(npw))) {
						// if (opw.equals(npw)) {
						request.setAttribute("status", "New Password is same as old Password");
						RequestDispatcher rd = request.getRequestDispatcher("forgot.jsp");
						rd.forward(request, response);
						// }
					}
				} else {
					if (s.equals("success")) {
						String status = reg.resetPassword(email, npw);
						if (status.equals("success"))
							request.setAttribute("status", "Password changed successfully");
						RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
						rd.forward(request, response);
					} else {
						request.setAttribute("status", "Enter the old Password corectly");
						RequestDispatcher rd = request.getRequestDispatcher("forgot.jsp");
						rd.forward(request, response);
					}
				}

			}

			else if (request.getParameter("addevent") != null) {
				String img = request.getParameter("image");
				String name = request.getParameter("name");
				String cost = request.getParameter("cost");
				String details = request.getParameter("details");
				String category = request.getParameter("category");
				String status = reg.addEvent(img, name, cost, details, category);
				if (status.equals("Submitted")) {
					request.setAttribute("status", "New Event Added");
					RequestDispatcher rd = request.getRequestDispatcher("addDelEvent.jsp");
					rd.forward(request, response);
				} else if (status.equals("Already Added")) {
					request.setAttribute("status", "Already Added");
					RequestDispatcher rd = request.getRequestDispatcher("addDelEvent.jsp");
					rd.forward(request, response);
				} else if (status.equals("Failed")) {
					request.setAttribute("status", "Failed To Add Event");
					RequestDispatcher rd = request.getRequestDispatcher("addDelEvent.jsp");
					rd.forward(request, response);
				}
			} else if (request.getParameter("delevent") != null) {
				String category = request.getParameter("ecategory");
				String event = request.getParameter("ename");
				String status = reg.delEvent(event,category);
				if (status.equals("success")) {
					request.setAttribute("status", "Event Deleted");
					RequestDispatcher rd = request.getRequestDispatcher("addDelEvent.jsp");
					rd.forward(request, response);
				} else if (status.equals("not available")) {
					request.setAttribute("status", "Event Category doesn't exist");
					RequestDispatcher rd = request.getRequestDispatcher("addDelEvent.jsp");
					rd.forward(request, response);
				} else if (status.equals("failed")) {
					request.setAttribute("status", "Failed to Delete Event");
					RequestDispatcher rd = request.getRequestDispatcher("addDelEvent.jsp");
					rd.forward(request, response);
				}
			}
			else if (request.getParameter("review") != null) {
				String rating = request.getParameter("rating");
				String opinion = request.getParameter("opinion");
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String status = reg.review(name, email, rating, opinion);
				if (status.equals("Successful")) {
					request.setAttribute("status", "Thank you for your Feedback");
					RequestDispatcher rd = request.getRequestDispatcher("review.jsp");
					rd.forward(request, response);
				} else if (status.equals("Failed")) {
					request.setAttribute("status", "Failed to recieve your Feedback");
					RequestDispatcher rd = request.getRequestDispatcher("review.jsp");
					rd.forward(request, response);
				}
			}
			else if (request.getParameter("enquiry") != null) {
				String enquiry = request.getParameter("enquiry");
				String name = request.getParameter("uname");
				String email = request.getParameter("email");
				
				String status = reg.enquiry(name, email, enquiry);
				
				if (status.equals("Successful")) {
					request.setAttribute("status", "Enquiry Submitted Successfuly");
					RequestDispatcher rd = request.getRequestDispatcher("Enquiry_user.jsp");
					rd.forward(request, response);
				} else if (status.equals("Failed")) {
					request.setAttribute("status", "Failed to submit Enquiry");
					RequestDispatcher rd = request.getRequestDispatcher("Enquiry_user.jsp");
					rd.forward(request, response);
				}
				
			}
			else if (session.getAttribute("uname") != null && request.getParameter("admincancelenquiry") != null) {
				int event_id = Integer.parseInt(request.getParameter("event_id"));
				int status = reg.delEnquiry(event_id);
				if (status > 0) {
					request.setAttribute("status", "Enquiry Deleted Successfuly");
					RequestDispatcher rd = request.getRequestDispatcher("Enquiry_admin.jsp");
					rd.forward(request, response);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	public String getServletInfo() {
		return "Short description";
	}
}
