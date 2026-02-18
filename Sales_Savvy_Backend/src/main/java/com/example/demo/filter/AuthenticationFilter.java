//package com.example.demo.filter;
//
//import java.io.IOException;
//import java.util.Arrays;
//import java.util.Optional;
//
//import org.springframework.stereotype.Component;
//
//import com.example.demo.entity.User;
//import com.example.demo.repository.UserRepository;
//import com.example.demo.service.AuthService;
//
//import jakarta.servlet.Filter;
////import jakarta.servlet.annotation.WebFilter;
//import jakarta.servlet.FilterChain;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.ServletRequest;
//import jakarta.servlet.ServletResponse;
//import jakarta.servlet.http.Cookie;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//@Component
//public class AuthenticationFilter implements Filter {
//
//    private final AuthService authService;
//    private final UserRepository userRepository;
//
//    public AuthenticationFilter(AuthService authService, UserRepository userRepository) {
//        this.authService = authService;
//        this.userRepository = userRepository;
//    }
//
//    @Override
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//            throws IOException, ServletException {
//
//        HttpServletRequest httpRequest = (HttpServletRequest) request;
//        HttpServletResponse httpResponse = (HttpServletResponse) response;
//
//
//        /*  
//         * ===========================================================
//         *                NEW CORS LINES ADDED HERE
//         * ===========================================================
//         */
//        httpResponse.setHeader("Access-Control-Allow-Origin", "http://localhost:5173");
//        httpResponse.setHeader("Access-Control-Allow-Credentials", "true");
//        httpResponse.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
//        httpResponse.setHeader("Access-Control-Allow-Headers", "Origin, Content-Type, Accept, Authorization, X-Requested-With");
//        httpResponse.setHeader("Access-Control-Max-Age", "3600");
//        /*  
//         * ===========================================================
//         *                END OF NEW CORS LINES
//         * ===========================================================
//         */
//
//
//        // ==== NEW: short-circuit preflight =====
//        if (httpRequest.getMethod().equalsIgnoreCase("OPTIONS")) {
//            httpResponse.setStatus(HttpServletResponse.SC_OK);
//            return;
//        }
//        // ========================================
//
//
//        // Public endpoints
//        if (httpRequest.getRequestURI().equals("/api/users/register") ||
//            httpRequest.getRequestURI().equals("/api/auth/login")) {
//
//            chain.doFilter(request, response);
//            return;
//        }
//
//        // Token validation logic
//        String token = getAuthTokenFromCookies(httpRequest);
//        if (token == null || !authService.validateToken(token)) {
//            httpResponse.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
//            httpResponse.getWriter().write("Unauthorized: Invalid or missing token");
//            return;
//        }
//
//        // Extract user information
//        String username = authService.extractUsername(token);
//        Optional<User> userOptional = userRepository.findByUsername(username);
//        if (userOptional.isEmpty()) {
//            httpResponse.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
//            httpResponse.getWriter().write("Unauthorized: User not found");
//            return;
//        }
//
//        // Attach authenticated user details to the request
//        httpRequest.setAttribute("authenticatedUser", userOptional.get());
//        chain.doFilter(request, response);
//    }
//
//    private String getAuthTokenFromCookies(HttpServletRequest request) {
//        Cookie[] cookies = request.getCookies();
//
//        if (cookies != null) {
//            return Arrays.stream(cookies)
//                    .filter(cookie -> "authToken".equals(cookie.getName()))
//                    .map(Cookie::getValue)
//                    .findFirst()
//                    .orElse(null);
//        }
//        return null;
//    }
//}






//===============================



package com.example.demo.filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.Optional;

import org.springframework.stereotype.Component;

import com.example.demo.entity.Role;
import com.example.demo.entity.User;
import com.example.demo.repository.UserRepository;
import com.example.demo.service.AuthService;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class AuthenticationFilter implements Filter {

    private final AuthService authService;
    private final UserRepository userRepository;

    private static final String FRONTEND_ORIGIN = "http://localhost:5173";

    private static final String[] PUBLIC_ENDPOINTS = {
            "/api/auth/login",
            "/api/users/register"
    };

    public AuthenticationFilter(AuthService authService, UserRepository userRepository) {
        this.authService = authService;
        this.userRepository = userRepository;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // ===========================================================
        // ✅ CORS (ONLY 5173)
        // ===========================================================
        httpResponse.setHeader("Access-Control-Allow-Origin", FRONTEND_ORIGIN);
        httpResponse.setHeader("Access-Control-Allow-Credentials", "true");
        httpResponse.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
        httpResponse.setHeader(
                "Access-Control-Allow-Headers",
                "Origin, Content-Type, Accept, Authorization, X-Requested-With"
        );
        httpResponse.setHeader("Access-Control-Max-Age", "3600");
        // ===========================================================

        // Preflight request
        if (httpRequest.getMethod().equalsIgnoreCase("OPTIONS")) {
            httpResponse.setStatus(HttpServletResponse.SC_OK);
            return;
        }

        String requestURI = httpRequest.getRequestURI();

        // Public endpoints
        if (Arrays.asList(PUBLIC_ENDPOINTS).contains(requestURI)) {
            chain.doFilter(request, response);
            return;
        }

        // ===========================================================
        // 🔐 AUTHENTICATION
        // ===========================================================
        String token = getAuthTokenFromCookies(httpRequest);
        if (token == null || !authService.validateToken(token)) {
            httpResponse.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            httpResponse.getWriter().write("Unauthorized: Invalid or missing token");
            return;
        }

        String username = authService.extractUsername(token);
        Optional<User> userOptional = userRepository.findByUsername(username);
        if (userOptional.isEmpty()) {
            httpResponse.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            httpResponse.getWriter().write("Unauthorized: User not found");
            return;
        }

        User authenticatedUser = userOptional.get();
        Role role = authenticatedUser.getRole();

        // ===========================================================
        // 🔑 AUTHORIZATION (ROLE HANDLING)
        // ===========================================================
        if (requestURI.startsWith("/admin/") && role != Role.ADMIN) {
            httpResponse.setStatus(HttpServletResponse.SC_FORBIDDEN);
            httpResponse.getWriter().write("Forbidden: Admin access required");
            return;
        }

        if (requestURI.startsWith("/api/")
                && role != Role.ADMIN
                && role != Role.CUSTOMER) {
            httpResponse.setStatus(HttpServletResponse.SC_FORBIDDEN);
            httpResponse.getWriter().write("Forbidden");
            return;
        }

        // Attach authenticated user
        httpRequest.setAttribute("authenticatedUser", authenticatedUser);
        chain.doFilter(request, response);
    }

    private String getAuthTokenFromCookies(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            return Arrays.stream(cookies)
                    .filter(cookie -> "authToken".equals(cookie.getName()))
                    .map(Cookie::getValue)
                    .findFirst()
                    .orElse(null);
        }
        return null;
    }
}
