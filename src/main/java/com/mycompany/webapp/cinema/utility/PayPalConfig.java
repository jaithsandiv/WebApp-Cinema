/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.webapp.cinema.utility;

import com.paypal.base.rest.APIContext;

public class PayPalConfig {
    private static final String CLIENT_ID = "AXJOq_IBRksXX0ROPtCoj1NR1MAUbInKQzuK75joBSPRX9FdtiioZjlCrGZ0xkTWIOcqeVqjJw0tUUvf";
    private static final String CLIENT_SECRET = "ELFI-Zmn-Mct6gnnd8PI7TtOazqk2c9Zrhs92MFpbjhsHFbeqH8AvckFu5mUj5gE7iASCExddAwwXUED";
    private static final String MODE = "sandbox"; // Use "live" for production

    public static APIContext getAPIContext() {
        return new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
    }
}
