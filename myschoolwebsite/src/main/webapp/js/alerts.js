
const params = new URLSearchParams(window.location.search);
const msg = params.get("msg");

if (msg === "added") {

	Swal.fire({
		icon: 'success',
		title: 'Success',
		text: 'Data Added Successfully!'
	});

}

else if (msg === "deleted") {

	Swal.fire({
		icon: 'success',
		title: 'Deleted',
		text: 'Data Deleted Successfully!'
	});

}

else if (msg === "updated") {

	Swal.fire({
		icon: 'success',
		title: 'Updated',
		text: 'Data Updated Successfully!'
	});

}

else if (msg === "error") {

	Swal.fire({
		icon: 'error',
		title: 'Error',
		text: 'Something went wrong!'
	});

}


function confirmDelete(url) {

	Swal.fire({
		title: 'Are you sure?',
		text: "This record will be permanently deleted!",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#d33',
		cancelButtonColor: '#3085d6',
		confirmButtonText: 'Yes, delete it!'
	}).then((result) => {

		if (result.isConfirmed) {

			window.location.href = url;

		}

	});

}