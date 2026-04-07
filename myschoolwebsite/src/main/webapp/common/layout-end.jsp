</div>
</div>
</div>

<!-- Bootstrap JS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- SweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- Common Alerts Script -->
<script src="<%=request.getContextPath()%>/js/alerts.js"></script>

<script>
	function toggleSidebar() {

		let sidebar = document.getElementById("sidebar");

		sidebar.classList.toggle("collapsed");

	}
</script>

</body>
</html>