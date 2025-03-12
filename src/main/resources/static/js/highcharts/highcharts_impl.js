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
		            value: 15.17
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
		            value: 14.67
		        },
		        {
		            name: "Web Services",
		            value: 15.75
		        },
		        {
		            name: "XML",
		            value: 15.75
		        }]
		    }, {
		        name: 'Framework',
		        data: [{
		            name: "Spring / Spring Boot",
		            value: 12.08
		        },
		        {
		            name: "Struts",
		            value: 3.42
		        },
		        {
		            name: "Spring MVC",
		            value: 8.17
		        },
		        {
		            name: "Spring Security",
		            value: 8.17
		        },
		        {
		            name: "Spring Hibernate",
		            value: 8.17
		        },
		        {
		            name: "J2EE",
		            value: 11.5
		        }]
		    }, {
		        name: 'Cloud Services',
		        data: [{
		            name: "Amazon AWS",
		            value: 2.00
		        },
		        {
		            name: "Heroku",
		            value: 2.00
		        },
		        {
		            name: "Redhat OpenShift",
		            value: 1.00
		        }]		    
		    }, {
		        name: 'Application Server',
		        data: [{
		            name: "Apache Tomcat",
		            value: 8.67
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
		            value: 4.33      
		        }]
		    }, {
		        name: 'Database',
		        data: [{
		            name: "Oracle",
		            value: 10.75
		        },
		        {
		            name: "PostgreSQL",
		            value: 2.33
		        },
		        {
		            name: "MS SQL Server",
		            value: 3.58
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
		        data: [
		        {
		            name: "Eclipse",
		            value: 11.58
		        },
		        {
		            name: "Junit",
		            value: 11.58
		        },
		        {
		            name: "SoapUI",
		            value: 6.17
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
		            value: 7.92
		        },
		        {
		            name: "GIT",
		            value: 2.42
		        },
		        {
		            name: "JIRA",
		            value: 2.25
		        },
		        {
		            name: "SonarQube",
		            value: 1.58
		        },
		        {
		            name: "Bit Bucket",
		            value: 2.25
		        }]
		    }]
		});