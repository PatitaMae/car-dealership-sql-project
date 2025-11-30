USE car_dealership;

-- =====================
-- Sample Data: Branches
-- =====================
INSERT INTO branches (branch_name, city, state, phone_number) VALUES
('Sunshine Motors - San Diego', 'San Diego', 'CA', '619-555-0101'),
('Bay Area Auto - San Jose',    'San Jose',  'CA', '408-555-0123'),
('Capital City Cars - Sacramento', 'Sacramento', 'CA', '916-555-0199');

-- =====================
-- Sample Data: Car Models
-- =====================
INSERT INTO car_models (make, model_name, model_year, body_type, fuel_type, transmission, base_price) VALUES
('Toyota', 'Camry',  2022, 'Sedan',   'Gas',    'Automatic', 28000.00),
('Toyota', 'RAV4',   2023, 'SUV',     'Hybrid', 'Automatic', 35000.00),
('Honda',  'Civic',  2022, 'Sedan',   'Gas',    'Manual',    24000.00),
('Honda',  'CR-V',   2023, 'SUV',     'Gas',    'Automatic', 32000.00),
('Tesla',  'Model 3',2023, 'Sedan',   'Electric','Automatic',42000.00),
('Ford',   'F-150',  2023, 'Truck',   'Gas',    'Automatic', 45000.00);

-- =====================
-- Sample Data: Customers
-- =====================
INSERT INTO customers (first_name, last_name, email, phone_number, city, state) VALUES
('Alex',   'Ramirez', 'alex.ramirez@example.com', '619-555-1001', 'San Diego',   'CA'),
('Jordan', 'Lee',     'jordan.lee@example.com',   '408-555-1002', 'San Jose',    'CA'),
('Taylor', 'Nguyen',  'taylor.nguyen@example.com','916-555-1003', 'Sacramento',  'CA'),
('Morgan', 'Chen',    'morgan.chen@example.com',  '408-555-1004', 'San Jose',    'CA'),
('Riley',  'Patel',   'riley.patel@example.com',  '619-555-1005', 'San Diego',   'CA');

-- =====================
-- Sample Data: Inventory
-- (branch_id, model_id, quantity, min_threshold)
-- =====================

-- San Diego (branch_id = 1)
INSERT INTO inventory (branch_id, model_id, quantity, min_threshold) VALUES
(1, 1, 5,  2),
(1, 2, 2,  2),
(1, 3, 1,  2),
(1, 5, 0,  1);

-- San Jose (branch_id = 2)
INSERT INTO inventory (branch_id, model_id, quantity, min_threshold) VALUES
(2, 1, 2,  2),
(2, 2, 1,  2),
(2, 4, 4,  2),
(2, 5, 3,  1);

-- Sacramento (branch_id = 3)
INSERT INTO inventory (branch_id, model_id, quantity, min_threshold) VALUES
(3, 3, 3,  2),
(3, 4, 1,  2),
(3, 6, 2,  2);

-- =====================
-- Sample Data: Sales
-- =====================
INSERT INTO sales (branch_id, customer_id, model_id, sale_date, sale_price, payment_type) VALUES
(1, 1, 1, '2025-01-10', 27500.00, 'Financing'),
(1, 5, 2, '2025-02-05', 34500.00, 'Cash'),
(2, 2, 5, '2025-02-12', 43000.00, 'Financing'),
(2, 4, 1, '2025-03-01', 27800.00, 'Lease'),
(3, 3, 6, '2025-03-15', 46000.00, 'Financing'),
(3, 3, 3, '2025-03-20', 23800.00, 'Cash'),
(2, 2, 4, '2025-04-05', 31800.00, 'Financing');
