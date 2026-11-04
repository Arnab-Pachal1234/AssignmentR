# Input Basic Pay
# basic_pay <- as.numeric(readline(prompt = "Enter Basic Pay: "))
basic_pay <- 50000

# Allowances and Deductions
hra <- 0.20 * basic_pay       # 20% of Basic Pay
da  <- 0.15 * basic_pay       # 15% of Basic Pay

gross_salary <- basic_pay + hra + da
tax <- 0.10 * gross_salary    # 10% Tax (use 0.10 * basic_pay if prof defines tax on Basic)
net_salary <- gross_salary - tax

cat("Basic Pay:   ", basic_pay, "\n")
cat("HRA (20%):   ", hra, "\n")
cat("DA (15%):    ", da, "\n")
cat("Gross Salary:", gross_salary, "\n")
cat("Tax (10%):   ", tax, "\n")
cat("Net Salary:  ", net_salary, "\n")