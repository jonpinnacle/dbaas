CREATE OR REPLACE FUNCTION f_Pwd_verify_complexity (
   username       VARCHAR2,
   PASSWORD       VARCHAR2,
   old_password   VARCHAR2
)
   RETURN BOOLEAN
IS
   n                BOOLEAN;
   m                INTEGER;
   differ           INTEGER;
   isdigit          BOOLEAN;
   ischarlower      BOOLEAN;
   ischarupper      BOOLEAN;
   ispunct          BOOLEAN;
   isFrist	    BOOLEAN;
   digitarray       VARCHAR2 (20);
   punctarray       VARCHAR2 (25);
   chararraylower   VARCHAR2 (52);
   chararrayupper   VARCHAR2 (52);
BEGIN
   digitarray := '0123456789';
   chararraylower := 'abcdefghijklmnopqrstuvwxyz';
   chararrayupper := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
   punctarray := '!#$%^*+-_=<>';

-- Check if the password is same as the username
   IF NLS_LOWER (PASSWORD) = NLS_LOWER (username)
   THEN
		raise_application_error(-20003, 'Password must be at least 12 characters in length,
		should contain at least 1 UPPER and at least 1 LOWER Letter, at least 1 DIGIT and at least 1 SPECIAL CHARACTER(!#$%^*+-_=<>),
		should NOT start with digit or special character, NOT be same as USERNAME');
   END IF;

-- Check for the minimum length of the password
   IF LENGTH (PASSWORD) < 12
   THEN
		raise_application_error(-20003, 'Password must be at least 12 characters in length,
		should contain at least 1 UPPER and at least 1 LOWER Letter, at least 1 DIGIT and at least 1 SPECIAL CHARACTER(!#$%^*+-_=<>),
		should NOT start with digit or special character, NOT be same as USERNAME');
   END IF;

-- Check if the password is too simple. A dictionary of words may be maintained and a check may be made so as not to allow the words
-- that are too simple for the password.
   IF NLS_LOWER (PASSWORD) IN ('welcome', 'database', 'account', 'user', 'password', 'oracle','computer', 'abcd','Charter1','charter1)')
   THEN
		raise_application_error(-20003, 'Password must be at least 12 characters in length,
		should contain at least 1 UPPER and at least 1 LOWER Letter, at least 1 DIGIT and at least 1 SPECIAL CHARACTER(!#$%^*+-_=<>),
		should NOT start with digit or special character, NOT be same as USERNAME');
   END IF;


--Check if the first letter is special character.
isFrist := TRUE;
FOR i IN 1 .. LENGTH (punctarray)
LOOP
	IF SUBSTR(PASSWORD, 1, 1) = SUBSTR(punctarray, i, 1)
        THEN
        	isFrist := FALSE;
	END IF;
END LOOP;
IF isFrist = FALSE
THEN
        raise_application_error(-20003, 'Password must be at least 12 characters in length,
		should contain at least 1 UPPER and at least 1 LOWER Letter, at least 1 DIGIT and at least 1 SPECIAL CHARACTER(!#$%^*+-_=<>),
		should NOT start with digit or special character, NOT be same as USERNAME');
END IF;


--Check if the first letter is digit.
isFrist := TRUE;
FOR i IN 1 .. LENGTH (digitarray)
LOOP
	IF SUBSTR(PASSWORD, 1, 1) = SUBSTR(digitarray, i, 1)
        THEN
        	isFrist := FALSE;
	END IF;
END LOOP;
IF isFrist = FALSE
THEN
        raise_application_error(-20003, 'Password must be at least 12 characters in length,
		should contain at least 1 UPPER and at least 1 LOWER Letter, at least 1 DIGIT and at least 1 SPECIAL CHARACTER(!#$%^*+-_=<>),
		should NOT start with digit or special character, NOT be same as USERNAME');
END IF;

-- Check if the password contains at least one letter, one digit and one
-- punctuation mark.
-- 1. Check for the digit
   isdigit := FALSE;
   m := LENGTH (PASSWORD);
   FOR i IN 1 .. 10
   LOOP
      FOR j IN 1 .. m
      LOOP
         IF SUBSTR (PASSWORD, j, 1) = SUBSTR (digitarray, i, 1)
         THEN
            isdigit := TRUE;
            --GOTO findcharlower;
         END IF;
      END LOOP;
   END LOOP;
   IF isdigit = FALSE
   THEN
        raise_application_error(-20003, 'Password must be at least 12 characters in length,
		should contain at least 1 UPPER and at least 1 LOWER Letter, at least 1 DIGIT and at least 1 SPECIAL CHARACTER(!#$%^*+-_=<>),
		should NOT start with digit or special character, NOT be same as USERNAME');
   END IF;

-- 2. Check for the lowwer case character
   ischarlower := FALSE;
   FOR i IN 1 .. LENGTH (chararraylower)
   LOOP
      FOR j IN 1 .. m
      LOOP
         IF SUBSTR (PASSWORD, j, 1) = SUBSTR (chararraylower, i, 1)
         THEN
            ischarlower := TRUE;
            --GOTO findcharupper;
         END IF;
      END LOOP;
   END LOOP;
   IF ischarlower = FALSE
   THEN
		raise_application_error(-20003, 'Password must be at least 12 characters in length,
		should contain at least 1 UPPER and at least 1 LOWER Letter, at least 1 DIGIT and at least 1 SPECIAL CHARACTER(!#$%^*+-_=<>),
		should NOT start with digit or special character, NOT be same as USERNAME');
   END IF;

-- 3. Check for the upper case character
   ischarupper := FALSE;
   FOR i IN 1 .. LENGTH (chararrayupper)
   LOOP
      FOR j IN 1 .. m
      LOOP
         IF SUBSTR (PASSWORD, j, 1) = SUBSTR (chararrayupper, i, 1)
         THEN
            ischarupper := TRUE;
            --GOTO findpunct;
         END IF;
      END LOOP;
   END LOOP;
   IF ischarupper = FALSE
   THEN
		raise_application_error(-20003, 'Password must be at least 12 characters in length,
		should contain at least 1 UPPER and at least 1 LOWER Letter, at least 1 DIGIT and at least 1 SPECIAL CHARACTER(!#$%^*+-_=<>),
		should NOT start with digit or special character, NOT be same as USERNAME');
   END IF;

-- 4. Check for the punctuation
   ispunct := FALSE;
   FOR i IN 1 .. LENGTH (punctarray)
   LOOP
      FOR j IN 1 .. m
      LOOP
         IF SUBSTR (PASSWORD, j, 1) = SUBSTR (punctarray, i, 1)
         THEN
            ispunct := TRUE;
            GOTO endsearch;
		 ELSE
			ispunct := FALSE;
         END IF;
      END LOOP;
   END LOOP;
   <<endsearch>>
   IF ispunct = FALSE
   THEN
		raise_application_error(-20003, 'Password must be at least 12 characters in length,
		should contain at least 1 UPPER and at least 1 LOWER Letter, at least 1 DIGIT and at least 1 SPECIAL CHARACTER(!#$%^*+-_=<>),
		should NOT start with digit or special character, NOT be same as USERNAME');
   END IF;

-- Everything is fine; return TRUE ;
   RETURN (TRUE);
END;
/
EXIT
