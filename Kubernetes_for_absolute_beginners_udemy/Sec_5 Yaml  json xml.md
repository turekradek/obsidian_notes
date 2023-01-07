# section 5 : YAML introduction [[1 Kubernetes_for_absolute_beginners]]
configuration files xml , json yaml
xml
```xml
<Serers>
	<Server>
		<name>Server1</name>
		<owner>John</owner>
		<created>12345</created>
		<status>active</status>
	</Server>
</Serers>	
```
JSON
```JSON
{
	Servers: [
		{
			name: Server1,
			owner: John,
			created: 12345,
			status: active
		}
	]
}
```
YAML
```YAML
Servers:
	- name: Server1
	- owner: John
	- created: 12345
	- status: active
```
yaml
key value pair
fruit: apple
meat: chicken

should be space after : 
spaces in yaml
> corect spaces
```corect spaces
Banana:
	Calories: 100
	Fat: 0.4 g
	Carbs: 27 g
```
```incorect_
Banana:
	Calories: 100
		Fat: 0.4 g
		Carbs: 27 g
```

yaml 
```more_advance
	Fruits:
		-	Banana:
				Calories: 100
				Fat: 0.4 g
				Carbs: 27 g
		-    Apple:
				Calories: 100
				Fat: 0.4 g
				Carbs: 27 g
```

## Exersice
1. Update the **food.yml** file to add a **Vegetable** - **Carrot.**
	Fruit: Apple
	Drink: Water
	Dessert: Cake
	Vegetable: Carrot
2. Update the **food.yml** file to add a list of **Vegetables** - **Carrot**, **Tomato**, **Cucumber**
	Fruits:
	  - Apple
	  - Banana
	  - Orange
	Vegetables:
	    - Carrot
	    - Tomato
	    - Cucumber
3. Jacob is **30** year old Male working as a **Systems Engineer** at a firm. Represent Jacob's information (**Name, Sex, Age, Title**) in YAML format. Create a dictionary named **Employee** and define properties under it.
	Employee:
	    Name: Jacob
	    Sex: Male
	    Age: 30
	    Title: Systems Engineer 
5. Update the YAML file to represent the Projects assigned to Jacob. Remember Jacob works on Multiple projects - **Automation** and **Support**. So remember to use a list.
		Employee:
		  Name: Jacob
		  Sex: Male
		  Age: 30
		  Title: Systems Engineer
		  Projects:
				    - Automation
				    - Support 
6. Update the YAML file to include Jacob's pay slips. Add a new property "**Payslips**" and create a list of pay slip details (Use list of dictionaries). Each payslip detail contains **Month** and **Wage**.
		Employee:
		  Name: Jacob
		  Sex: Male
		  Age: 30
		  Title: Systems Engineer
		  Projects:
				    - Automation
				    - Support
		  Payslips:
				    - Month: June
			Wage: 4000
				    - Month: July
			Wage: 4500
				    - Month: August
			Wage: 4000
---
