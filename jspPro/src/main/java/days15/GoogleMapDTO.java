package days15;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GoogleMapDTO {

   private int id;
   private String type;
   private String name;
   private double lng;
   private double lat;
   private String address;
   
}
