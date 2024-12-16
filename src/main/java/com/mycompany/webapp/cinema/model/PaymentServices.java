/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.webapp.cinema.model;


import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import java.util.ArrayList;
import java.util.List;

public class PaymentServices {
    private static final String CLIENT_ID = "AZXzv4l-9ym8KFQKsEXxomDG9ax68rdb4bvKLcgJJmGxzDdHQs1DDADklHg9F2skvUxUBiKvB5i4d8vi";  // Replace with your PayPal Client ID
    private static final String CLIENT_SECRET = "EFI56n7NPnTKRDS3r6f16HK_xi6eVeNVHydrRtJeJc_7ZPRcGKwGSTfG86NJuD8zEkH1V8agByRkMIJ2";  // Replace with your PayPal Client Secret
    private static final String MODE = "sandbox";  // Set to "live" for production

    // Authorizes the payment by creating a payment request
    public String authorizePayment(OrderDetails orderDetail) throws PayPalRESTException {

        Payer payer = getPayerInformation();
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInformation(orderDetail);

        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");

        // Set up the API context with client ID, secret, and mode
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        // Create the payment request
        Payment approvedPayment = requestPayment.create(apiContext);

        // Return the approval URL to redirect the user
        return getApprovalLink(approvedPayment);
    }

    // Creates the payer object with user details
    private Payer getPayerInformation() {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");

        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setFirstName("Yehan")
                 .setLastName("Raveesha")
                 .setEmail("YY@company.com");

        payer.setPayerInfo(payerInfo);
        return payer;
    }

    // Sets up the URLs for return and cancel actions
    private RedirectUrls getRedirectURLs() {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/WebApp-Cinema/error.jsp");  // Set cancel URL
        redirectUrls.setReturnUrl("http://localhost:8080/WebApp-Cinema/payment_success.jsp");  // Set return URL
        return redirectUrls;
    }

    // Creates the transaction object with details of the movie booking
    private List<Transaction> getTransactionInformation(OrderDetails orderDetail) {
        Details details = new Details();
        details.setSubtotal(orderDetail.getSubtotal());
        details.setTax(orderDetail.getTax());

        Amount amount = new Amount();
        amount.setCurrency("USD");
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
        item.setPrice(orderDetail.getSubtotal());
        item.setTax(orderDetail.getTax());
        item.setQuantity("1");

        items.add(item);
        itemList.setItems(items);
        transaction.setItemList(itemList);

        List<Transaction> listTransaction = new ArrayList<>();
        listTransaction.add(transaction);

        return listTransaction;
    }

    // Extracts the approval URL from the PayPal response
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

