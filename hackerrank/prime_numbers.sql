DECLARE @n INT = 1000; -- Upper limit for prime numbers
DECLARE @result NVARCHAR(MAX) = ''; -- Result string to store prime numbers

DECLARE @counter INT;
DECLARE @k INT;
DECLARE @i INT;

-- Loop through numbers from 2 to @n
DECLARE @num INT = 2;
WHILE @num <= @n
BEGIN
    SET @counter = 0; -- Reset counter for each number
    SET @k = @num / 2; -- Floor division to find the upper limit for divisors

    -- Check if @num is divisible by any number from 2 to @k
    SET @i = 2;
    WHILE @i <= @k
    BEGIN
        IF (@num % @i = 0)
        BEGIN
            SET @counter = 1; -- Not a prime number
            BREAK;
        END;
        SET @i = @i + 1;
    END;

    -- If @num is prime, append it to the result string
    IF (@counter = 0)
    BEGIN
        SET @result = @result + CAST(@num AS NVARCHAR) + '&';
    END;

    SET @num = @num + 1; -- Move to the next number
END;

-- Remove the trailing '&' and print the result
SET @result = LEFT(@result, LEN(@result) - 1);
PRINT @result;
