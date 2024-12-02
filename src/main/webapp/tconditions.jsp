<!-- Active Page: pass an empty string if the page isn't listed in navbar -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Include header with parameters -->
<jsp:include page="jsp/header.jsp">
    <jsp:param name="logo" value="./images/logotab.png" />
    <jsp:param name="title" value="ABC Cinema" />
    <jsp:param name="css" value="common.css" />
    <jsp:param name="activePage" value="home" />   
</jsp:include>
<div class="banner">
    <h1>Terms and Conditions</h1>
</div>

<div class="terms-content">
    <div class="terms-section">
        <h2>1. Introduction</h2>
        <p>www.abccinemas.com is owned and operated by ABC Cinemas Private Limited, a company registered in Sri Lanka (referred to as "ABC CINEMAS", "www.abccinemas.com", "we", "us" or "our" herein). PLEASE READ THESE TERMS OF USE CAREFULLY BEFORE USING THIS SITE. By using this Site or by clicking a box that states that you accept or agree to these terms, you signify your agreement to these terms of use. If you do not agree to these terms of use, you may not use this Site. You acknowledge that these terms of use are supported by reasonable and valuable consideration, the receipt and adequacy of which are hereby acknowledged.</p>
    </div>

    <div class="terms-section">
        <h2>2. Using the Site and Content</h2>
        <p>The Site is only for your personal use. You may not use the Site for commercial purposes or in any way that is unlawful, or harms us or any other person or entity, as determined in our sole discretion.</p>
        <p>The following are the terms and conditions applicable to access and use of this website (or 'site'). By gaining access to and using this site, you agree to comply with these terms and conditions and all applicable laws, rules and regulations.</p>
        <p>If you are not agreeable with these Terms of Use, kindly refrain from accessing and using the service provided by www.abccinemas.com.</p>
        <p>Registering with and/or the use of the www.abccinemas.com services and products, including and without limitation the www.abccinemas.com web site, purchase of movie and/or DVD ?CD purchasing online, and other similar products or services offered by www.abccinemas.com, is indicative that you have read and understood the terms and conditions set forth below and agree to be legally bound by the said terms and conditions.</p>
        <p>We reserve the right to change these terms of use from time to time by posting the new version on the website. It is your responsibility to check regularly this page for the latest terms and conditions.</p>
    </div>

    <div class="terms-section">
        <h2>3. Permitted Use</h2>
        <p>The service provided by www.abccinemas.com is for personal & non-commercial use. You hereby agree that you will not duplicate, download, publish, modify, distribute and/or use any material included in www.abccinemas.com for any purpose, unless and otherwise you have obtained prior written permission from www.abccinemas.com.</p>
        <p>You also agree that you will not use the services provided by www.abccinemas.com for any purpose other than to subscribe and review the information in www.abccinemas.com and purchase movie tickets and /or DVD ? CD's for your personal use.</p>
        <p>Use of the material and / or content contained in www.abccinemas.com for any purpose not set forth in these Terms of Use is strictly prohibited.</p>
    </div>

    <div class="terms-section">
        <h2>4. Suppliers Terms and Conditions for the Sale of Items</h2>
        <p>All purchases made through our website are subject to the specific terms and conditions of our suppliers. These terms will be made available to you during the purchasing process.</p>
    </div>
</div>
<!-- Footer -->
<jsp:include page="jsp/footer.jsp">
    <jsp:param name="js" value="common.js" />
</jsp:include>