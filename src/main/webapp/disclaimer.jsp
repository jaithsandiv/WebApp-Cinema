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
<!-- Page Content -->
<div class="banner">
    <h1>Disclaimer</h1>
</div>
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-12 col-lg-10">
            <div class="disclaimer-content">
                <p>
                    This Website has been compiled in good faith by ABC cinemas and Theatres and all information and data provided on this site is for informational purposes only.
                </p>

                <p>
                    ABC cinemas and Theatres do not guarantee the accuracy, validity, completeness or the suitability of any information or data on this site (www.abccinemas.com). No representation is made or warranty given, either express or implied as to the completeness or accuracy of the information that it contains, that it will be uninterrupted or error free or that any information is free of bugs, viruses, worms, trojan horses or other harmful components.
                </p>

                <p>
                    Although we believe that all information which currently appears on the www.abccinemas.com web site is to the best of our knowledge valid and accurate and has been obtained from reliable sources, it is however the sole responsibility of the user to ascertain the validity and accuracy of the information provided on the www.abccinemas.com site prior to making decisions.
                </p>

                <p>
                    To the maximum extent permitted by law, ABC cinemas and Theatres disclaims all implied warranties with regard to information, products, services and material provided through this Website. All such information, products, services and materials are provided "as is" and "as available" without warranty of any kind.
                </p>

                <p>
                    This Website may contain links to Web Sites operated by third parties. Such links are provided for your reference only and your use of these sites may be subject to terms and conditions posted on them. Scope cinemas and Theatres inclusion of links to other Websites does not imply any endorsement of the material on such Websites and ABC cinemas and Theatres accepts no liability for their contents. Further the user agrees that ABC cinemas and Theatres cannot be held responsible for any damage, claims or any mishaps that may happen to occur from any link leading outside this site.
                </p>

                <p>
                    By accessing this Website (www.abccinemas.com) you agree that ABC cinemas and Theatres will not be liable for any direct, indirect or consequential loss or damages of any nature arising from the use of this Website, including information and material contained in it, from your access of other material on the internet via web links from this Website, delay or inability to use this Website or the availability and utility of the products and services.
                </p>

                <p>
                    You further agree to indemnify, hold ABC cinemas and Theatres harmless from and covenant not to sue Scope cinemas and Theatres for any claims based on using this Website (www.scopecinemas.com).
                </p>
            </div>
        </div>
    </div>
</div>
<!-- Footer -->
<jsp:include page="jsp/footer.jsp">
    <jsp:param name="js" value="common.js" />
</jsp:include>