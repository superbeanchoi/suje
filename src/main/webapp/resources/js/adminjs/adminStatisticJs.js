$(function() {
    // 테이블에서 데이터 추출
    var todayMember;
    var todayStore;
    var todayPayCount;
    var todayPaySum;

    // 데이터 추출
    todayMember = $('.todaySujeTable tbody tr').find('td:nth-child(1)').text().trim();
    todayStore = $('.todaySujeTable tbody tr').find('td:nth-child(2)').text().trim();
    todayPayCount = $('.todaySujeTable tbody tr').find('td:nth-child(3)').text().trim();
    todayPaySum = $('.todaySujeTable tbody tr').find('td:nth-child(4)').text().trim();
    
    console.log(todayMember);
    console.log(todayStore);
    console.log(todayPayCount);
    console.log(todayPaySum);

    //오늘의 수제
    var ctx1 = document.querySelector('.todaySujeChart1').getContext('2d');
    var myChart = new Chart(ctx1, {
        type: "horizontalBar",
        data: {
            labels: ["가입회원", "입점스토어", "결제횟수"],
            datasets: [{
                label: "TODAY",
                data: [todayMember, todayStore, todayPayCount],
                backgroundColor : [ "#ADEFD1", "#00203F", "#EEE" ],
            }]
        },
        options: {
            legend: {
                display: false
            },
			maintainAspectRatio : false,
			responsive : false,
			scales : {
				xAxes : [ {
					ticks : {
						beginAtZero : true,
					}
				} ]
			},
        }
    });
    var ctx2 = document.querySelector('.todaySujeChart2').getContext('2d');
    var myChart = new Chart(ctx2, {
        type: "horizontalBar",
        data: {
            labels: ["결제금액"],
            datasets: [{
                label: "TODAY",
                data: [todayPaySum],
                backgroundColor : "#ADEFD1"
            }]
        },
        options: {
            legend: {
                display: false
            },
			maintainAspectRatio : false,
			responsive : false,
			scales : {
				xAxes : [ {
					ticks : {
						beginAtZero : true,
					}
				} ]
			},
        }
    });
    
    //카테고리별 수제 매출
    var catePayLabel = [];
    var catePayData = [];
    $('.catePayTable thead tr td').each(function() {
    	catePayLabel.push($(this).text().trim());
    });
    $('.catePayTable tbody tr td').each(function() {
    	catePayData.push($(this).text().trim());
    });
    
    console.log(catePayLabel);
    console.log(catePayData);
    
    var ctx3 = document.querySelector('.catePayChart').getContext('2d');
    var myChart = new Chart(ctx3, {
		type : 'pie',
		data : {
			labels : catePayLabel,
			datasets : [ {
				backgroundColor : [ "#ADEFD1", "#00203F", "#EEE" ],
				data : catePayData
			} ]
		},
		options : {
			maintainAspectRatio : false,
			responsive : false
		}
	});
	
	//회원 통계 - 나이
    var memberAgeLabel = [];
    var memberAgeData = [];
    $('.memberAgeTable thead tr td').each(function() {
    	memberAgeLabel.push($(this).text().trim());
    });
    $('.memberAgeTable tbody tr td').each(function() {
    	memberAgeData.push(Math.floor(parseFloat($(this).text().trim())));
    });
    
    console.log(memberAgeLabel);
    console.log(memberAgeData);
    
    var ctx3 = document.querySelector('.memberAgeChart').getContext('2d');
    var myChart = new Chart(ctx3, {
		type : 'bar',
		data : {
			labels : memberAgeLabel,
			datasets : [ {
				backgroundColor : [ "#ADEFD1", "#00203F", "#EEE", "#222", "#999" ],
				data : memberAgeData
			} ]
		},
		options: {
            legend: {
                display: false
            },
			maintainAspectRatio : false,
			responsive : false,
			scales : {
				yAxes : [ {
					ticks : {
						beginAtZero : true,
						precision: 0,
						stepSize : 1
					}
				} ]
			},
        }
	});
	
	//회원 통계 - 성별
    var memberManData = $('.memberSexTable tbody tr').find('td:nth-child(1)').text().trim();
    var memberWomanData = $('.memberSexTable tbody tr').find('td:nth-child(2)').text().trim();
    
    console.log(memberManData);
    console.log(memberWomanData);
    
    var ctx4 = document.querySelector('.memberSexChart').getContext('2d');
    var myChart = new Chart(ctx4, {
		type : 'pie',
		data : {
			labels : [ "남성", "여정" ],
			datasets : [ {
				backgroundColor : [ "#ADEFD1", "#00203F" ],
				data : [ memberManData, memberWomanData ]
			} ]
		},
		options : {
			maintainAspectRatio : false,
			responsive : false
		}
	});
	
	//금주 일별 매출
	var totalDateSalesDate = [];
	var totalDateSalesTotal = [];
    var totalDateSalesFee = [];
    $('.totalDateSalesTable tbody tr').each(function() {
    	var tdBox = $(this).find('td');
    	totalDateSalesDate.push(tdBox.eq(0).text().trim());
    	totalDateSalesTotal.push(tdBox.eq(1).text().trim());
    	totalDateSalesFee.push(tdBox.eq(2).text().trim());
    });
    
    console.log(totalDateSalesDate);
    console.log(totalDateSalesTotal);
    console.log(totalDateSalesFee);
    
    var ctx5 = document.querySelector('.totalDateSalesChart').getContext('2d');
    var myChart = new Chart(ctx5, {
		type : 'line',
		data : {
			labels : totalDateSalesDate,
			datasets: [{
				data: totalDateSalesTotal,
				borderColor: "#ADEFD1",
				label: '일별 총매출',
				fill : false
			}, {
				data: totalDateSalesFee,
				borderColor: "#00203F",
				label: ' 일별 총수익',
				fill : false
			}]

		},
		options : {
			maintainAspectRatio : false,
			responsive : false
		}
	});
	
	//금주 총매출
	var totalSalesTotal = [];
    var totalSalesFee = [];
    
    totalSalesTotal = $('.totalSalesTable tbody tr').find('td:nth-child(1)').text().trim();
    totalSalesFee = $('.totalSalesTable tbody tr').find('td:nth-child(2)').text().trim();
    
    console.log(totalSalesTotal);
    console.log(totalSalesFee);
    
    var ctx6 = document.querySelector('.totalSalesChart').getContext('2d');
    var myChart = new Chart(ctx6, {
		type : 'horizontalBar',
		data: {
            labels: ["주간 총매출", "주간 총수익"],
            datasets: [{
                data: [totalSalesTotal, totalSalesFee],
                backgroundColor : ["#ADEFD1", "#00203F"],
            }]
        },
        options: {
            legend: {
                display: false
            },
			maintainAspectRatio : false,
			responsive : false,
			scales : {
				xAxes : [ {
					ticks : {
						beginAtZero : true,
						stepSize : 500000
					}
				} ]
			},
        }
	});

});
