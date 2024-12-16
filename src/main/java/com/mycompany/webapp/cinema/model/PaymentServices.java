/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.webapp.cinema.model;

/**
 *
 * @author Shiraz
 */
 
 
import java.io.IOException;
import java.util.*;
import com.paypal.api.payments.*;
import com.paypal.base.rest.*;

public class PaymentServices {
    private static String CLIENT_ID;
    private static String CLIENT_SECRET;
    private static String MODE;

    // Static block to load PayPal credentials from system.properties
    static {
        try {
            Properties properties = new Properties();
            properties.load(PaymentServices.class.getResourceAsStream("/system.properties"));
            CLIENT_ID = properties.getProperty("paypal.client.id");
            CLIENT_SECRET = properties.getProperty("paypal.client.secret");
            MODE = properties.getProperty("paypal.mode");
        } catch (IOException e) {
            throw new RuntimeException("Failed to load PayPal credentials from properties file.", e);
        }
    }

    /**
     * Authorizes a payment using PayPal API
     *
     * @param orderDetail - details of the order (movie name, subtotal, tax, total)
     * @return URL for PayPal approval
     * @throws PayPalRESTException if any issue occurs during API interaction
     */
    public String authorizePayment(OrderDetails orderDetail) throws PayPalRESTException {
        Payer payer = getPayerInformation();
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInformation(orderDetail);

        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");

        // Set up API context with credentials
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        // Create payment request
        Payment approvedPayment = requestPayment.create(apiContext);

        // Get the approval URL to redirect the user
        return getApprovalLink(approvedPayment);
    }

    /**
     * Creates and returns the Payer object containing PayPal payment method
     *
     * @return Payer object
     */
    private Payer getPayerInformation() {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");

        // Add basic payer information (optional)
        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setFirstName("John")
                 .setLastName("Doe")
                 .setEmail("john.doe@example.com");

        payer.setPayerInfo(payerInfo);
        return payer;
    }

    /**
     * Returns redirect URLs for PayPal payment
     *
     * @return RedirectUrls object
     */
    private RedirectUrls getRedirectURLs() {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/moviebooking/payment_statusjsp");  // Update with your cancel URL
        redirectUrls.setReturnUrl("http://localhost:8080/moviebooking/payment_status.jsp");  // Update with your return URL
        return redirectUrls;
    }

    /**
     * Prepares the transaction details for the payment
     *
     * @param orderDetail - details of the order
     * @return List of Transaction objects
     */
    private List<Transaction> getTransactionInformation(OrderDetails orderDetail) {
        Details details = new Details();
        details.setSubtotal(orderDetail.getPrice());
        details.setTax(orderDetail.getTax());

        Amount amount = new Amount();
        amount.setCurrency("USD");  // Set currency code
        amount.setTotal(orderDetail.getTotal());
        amount.setDetails(details);

        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        transaction.setDescription(orderDetail.getMovieName());

        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();

        Item item = new Item();
        item.setCurrency("USD");
        item.setName(orderDetail.getMovieName());
        item.setPrice(orderDetail.getPrice());
        item.setTax(orderDetail.getTax());
        item.setQuantity("1");

        items.add(item);
        itemList.setItems(items);
        transaction.setItemList(itemList);

        List<Transaction> listTransaction = new ArrayList<>();
        listTransaction.add(transaction);

        return listTransaction;
    }

    /**
     * Extracts the approval URL from the PayPal API response
     *
     * @param approvedPayment - Payment object returned by PayPal API
     * @return Approval URL
     */
    private String getApprovalLink(Payment approvedPayment) {
        List<Links> links = approvedPayment.getLinks();
        String approvalLink = null;

        for (Links link : links) {
            if (link.getRel().equalsIgnoreCase("approval_url")) {
                approvalLink = link.getHref();
                break;
            }
        }

        return approvalLink;
    }
}
