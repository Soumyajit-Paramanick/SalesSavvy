import React from 'react';
import RegistrationPage from "./RegistrationPage";
import LoginPage from "./LoginPage";
import CustomerHomePage from "./CustomerHomePage";
import CartPage from "./CartPage";
import OrderPage from "./OrderPage";
import AdminLogin from "./AdminLogin"; 
import AdminDashboard from "./AdminDashboard";
import { Routes, Route } from "react-router-dom";
const AppRoutes = () => {
    return (
        <Routes>
            <Route path="/" element={<LoginPage />} />
            <Route path="register" element={<RegistrationPage />} />
            <Route path="/customerhome" element={<CustomerHomePage />} />
            <Route path="/UserCartPage" element={<CartPage />} />
            <Route path="/orders" element={<OrderPage />} />
            <Route path="/admin" element={<AdminLogin />} />
            <Route path="/admindashboard" element={<AdminDashboard />} />
        </Routes>
    )
};

export default AppRoutes;