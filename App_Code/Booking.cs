using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Booking
/// </summary>
public class Booking
{
    int dimension;

    public int Dimension
    {
        get { return dimension; }
        set { dimension = value; }
    }
    DateTime selctdDateTime;

    public DateTime SelctdDateTime
    {
        get { return selctdDateTime; }
        set { selctdDateTime = value; }
    }
    int screenNo;

    public int ScreenNo
    {
        get { return screenNo; }
        set { screenNo = value; }
    }

    String firstName;

    public String FirstName
    {
        get { return firstName; }
        set { firstName = value; }
    }
    String lastName;

    public String LastName
    {
        get { return lastName; }
        set { lastName = value; }
    }
    String address;

    public String Address
    {
        get { return address; }
        set { address = value; }
    }
    String showingDate;

    public String ShowingDate
    {
        get { return showingDate; }
        set { showingDate = value; }
    }
    String email;

    public String Email
    {
        get { return email; }
        set { email = value; }
    }
    String phoneNum;

    public String PhoneNum
    {
        get { return phoneNum; }
        set { phoneNum = value; }
    }
    String gender;

    public String Gender
    {
        get { return gender; }
        set { gender = value; }
    }
    String cardType;

    public String CardType
    {
        get { return cardType; }
        set { cardType = value; }
    }
    int cardCVV;

    public int CardCVV
    {
        get { return cardCVV; }
        set { cardCVV = value; }
    }
    int cardNum;

    public int CardNum
    {
        get { return cardNum; }
        set { cardNum = value; }
    }

    string movieName;

    public string MovieName
    {
        get { return movieName; }
        set { movieName = value; }
    }
    public Booking(String movieName)
    {
        this.movieName = movieName;
    }
    public Booking(int dimension, DateTime selctdDateTime, int screenNo)
    {
        this.dimension = dimension;
        this.selctdDateTime = selctdDateTime;
        this.screenNo = screenNo;
	}
}