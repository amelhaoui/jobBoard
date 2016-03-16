import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import DAO.*;
import Services.Services;


public class Test {

	public static void main(String[] args) {
		Services s=new Services();
		Offre o=s.getOffreById(3L);
		o.setEtatOffre("expiree");
		s.updateOffre(o);
		
		
		
	

}
}