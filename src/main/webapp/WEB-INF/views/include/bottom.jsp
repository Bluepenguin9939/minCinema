<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			</div>
            <!-- End of Main Content -->
            <!-- Footer -->
            <footer class="sticky-footer">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Min's Website 2023</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->
	
	<div class="faqBox rounded">
		<h3>도움말</h3><hr>
		<div class="questionBox">
			<div class="speech-bubble-answer">
			도움이 필요하신걸 클릭해주세요.
			</div>
		</div>
		<hr>		
		<a class="question-item" href="event" onclick="callFaq(this); return false;"><i class="fa fa-question"></i>이벤트</a>		
		<a class="question-item" href="register" onclick="callFaq(this); return false;"><i class="fa fa-question"></i>회원가입</a>
		<a class="question-item" href="pay" onclick="callFaq(this); return false;"><i class="fa fa-question"></i>결제문의</a>
	</div>
	<a class="faq rounded" onclick="callFaqBox();">
		<i class="fa fa-question"></i>
    </a>	
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

</body>

</html>