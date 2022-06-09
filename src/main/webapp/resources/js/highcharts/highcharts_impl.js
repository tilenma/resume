		Highcharts.chart('container', {
		    chart: {
		        type: 'packedbubble',
		        height: '100%'
		    },
		    title: {
		        text: 'Skills',
			    style: {
			        display: 'none'
			    }
		    },
		    tooltip: {
		        useHTML: true,
		        pointFormat: '<b>{point.name}:</b> {point.value} year(s) of experience'
		    },
		    plotOptions: {
		        packedbubble: {
		            minSize: '20%',
		            maxSize: '100%',
		            zMin: 0,
		            zMax: 12,
		            layoutAlgorithm: {
		                gravitationalConstant: 0.05,
		                splitSeries: true,
		                seriesInteraction: false,
		                dragBetweenSeries: true,
		                parentNodeLimit: true
		            },
		            dataLabels: {
		                enabled: true,
		                format: '{point.name}',
		                filter: {
		                    property: 'y',
		                    operator: '>',
		                    value: 0.5
		                },
		                style: {
		                    color: 'blue',
		                    fontWeight: 'normal',
		                    fontSize: '18px'
		                }
		            }
		        }
		    },
		    series: [{
		        name: 'Programming',
		        data: [{
		            name: 'Java',
		            value: 13.83
		        }, {
		            name: 'JavaScript',
		            value: 10.75
		        },
		        {
		            name: "Java Server Pages",
		            value: 12.42
		        },
		        {
		            name: "SQL",
		            value: 13.83
		        },
		        {
		            name: "Web Services",
		            value: 13.83
		        },
		        {
		            name: "XML",
		            value: 13.83
		        }]
		    }, {
		        name: 'Framework',
		        data: [{
		            name: "Spring",
		            value: 10.75
		        },
		        {
		            name: "Struts",
		            value: 3.42
		        },
		        {
		            name: "Spring MVC",
		            value: 7.33
		        },
		        {
		            name: "Spring Security",
		            value: 7.33
		        },
		        {
		            name: "Spring Hibernate",
		            value: 7.33
		        },
		        {
		            name: "J2EE",
		            value: 10.67
		        }]
		    }, {
		        name: 'Cloud Services',
		        data: [{
		            name: "Amazon AWS",
		            value: 1.50
		        },
		        {
		            name: "Heroku",
		            value: 2.00
		        },
		        {
		            name: "Redhat OpenShift",
		            value: 1.00
		        },
		        {
		            name: "Government EGIS",
		            value: 1.00 
		        }]		    
		    }, {
		        name: 'Application Server',
		        data: [{
		            name: "Apache Tomcat",
		            value: 6.58
		        },
		        {
		            name: "Oracle Weblogic",
		            value: 6.67
		        },
		        {
		            name: "Jboss",
		            value: 0.92
		        },
		        {
		            name: "IBM WebSphere",
		            value: 3.50         
		        }]
		    }, {
		        name: 'Database',
		        data: [{
		            name: "Oracle",
		            value: 9.92
		        },
		        {
		            name: "PostgreSQL",
		            value: 2.33
		        },
		        {
		            name: "MS SQL Server",
		            value: 2.75
		        },
		        {
		            name: "MySQL Server",
		            value: 3.17
		        }]
		    }, {
		        name: 'OS Platform',
		        data: [{
		            name: "HP Unix",
		            value: 3.42
		        },
		        {
		            name: "Windows Server",
		            value: 11.42
		        },
		        {
		            name: "CentOS",
		            value: 3.17
		        },
		        {
		            name: "Unix",
		            value: 1.00
		        },
		        {
		            name: "AIX",
		            value: 0.75
		        }]
		    }, {
		        name: 'Develop & Test',
		        data: [{
		            name: "Spring Tool Suite",
		            value: 5.25
		        },
		        {
		            name: "Eclipse",
		            value: 10.75
		        },
		        {
		            name: "Junit",
		            value: 10.75
		        },
		        {
		            name: "SoapUI",
		            value: 4.83
		        },
		        {
		            name: "Selenium",
		            value: 2.00
		        },
		        {
		            name: "IBM RAD",
		            value: 2.08
		        }]
		    }, {
		        name: 'DevOps',
		        data: [{
		            name: "Maven",
		            value: 9.33
		        },
		        {
		            name: "Subversion",
		            value: 9.33
		        },
		        {
		            name: "Jenkins",
		            value: 7.08
		        },
		        {
		            name: "GIT",
		            value: 1.42
		        },
		        {
		            name: "JIRA",
		            value: 1.42
		        },
		        {
		            name: "SonarQube",
		            value: 0.75
		        },
		        {
		            name: "GIT",
		            value: 1.42
		        },
		        {
		            name: "Bit Bucket",
		            value: 1.42
		        }]
		    }]
		});