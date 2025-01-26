CREATE TABLE public.login_history (
    id SERIAL PRIMARY KEY, -- Assuming 'id' is a unique identifier
    user_id INTEGER NOT NULL, -- Replace INTEGER with the correct data type if needed
    login_time TIMESTAMP, -- Assuming login_time is a timestamp
    logout_time TIMESTAMP, -- Assuming logout_time is a timestamp
    product_name VARCHAR(255), -- Adjust the length as needed
    usage_hours NUMERIC(10, 2) -- Assuming usage_hours is a decimal value
);

GRANT ALL PRIVILEGES ON TABLE public.login_history TO ssoni;



CREATE TABLE public.feature_requests (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    title VARCHAR(255),
    description TEXT,
    feature_type VARCHAR(100),
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create a function to update the updated_at column
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create a trigger to automatically update updated_at
CREATE TRIGGER trigger_update_updated_at
BEFORE UPDATE ON public.feature_requests
FOR EACH ROW
EXECUTE FUNCTION update_updated_at();

-- Grant full access to ssoni
GRANT ALL PRIVILEGES ON TABLE public.feature_requests TO ssoni;




CREATE TABLE public.apps (
    appid SERIAL PRIMARY KEY,
    desktop_app BOOLEAN DEFAULT FALSE,
    web_app BOOLEAN DEFAULT FALSE,
    price NUMERIC(10, 2)
);

GRANT ALL PRIVILEGES ON TABLE public.apps TO ssoni;





CREATE TABLE public.payment_history (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount NUMERIC(15, 2),
    product_name VARCHAR(255),
    transaction_id VARCHAR(255),
    payment_status VARCHAR(50),
    payment_method VARCHAR(50),
    currency VARCHAR(10),
    description TEXT
);

GRANT ALL PRIVILEGES ON TABLE public.payment_history TO ssoni;




CREATE TABLE public.users (
    userid SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    firstname VARCHAR(100),
    lastname VARCHAR(100),
    temppassword BOOLEAN DEFAULT FALSE,
    purchasedapps INTEGER DEFAULT 0,
    usingapps INTEGER DEFAULT 0,
    is_verified BOOLEAN DEFAULT FALSE,
    role VARCHAR(50),
    organization VARCHAR(255),
    phone_number VARCHAR(20),
    country VARCHAR(100),
    auth_type VARCHAR(50),
    profile_image TEXT
);

GRANT ALL PRIVILEGES ON TABLE public.users TO ssoni;









