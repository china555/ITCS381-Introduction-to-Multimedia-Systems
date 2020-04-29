class Shape
{
    int orderIdInLayer;
    public static final String SHAPETYPE = "BASESHAPE";
    String shapeType;

    public Shape( int orderIdInLayer )
    {
        this.orderIdInLayer = orderIdInLayer;
        shapeType = Shape.SHAPETYPE;
    }

    public JSONObject toJSONObject(){
        JSONObject theShapeJSON = new JSONObject();
        theShapeJSON.setInt( "id", orderIdInLayer );
        theShapeJSON.setString( "type", shapeType );
        return theShapeJSON;
    }

    public boolean fromJSONObject( JSONObject dataJSON){
        if(dataJSON != null){
            String dataType = (!dataJSON.isNull( "type")) ? dataJSON.getString( "type"): "";
            if( dataType.equals( this.shapeType)){
                orderIdInLayer = (!dataJSON.isNull( "id")) ? dataJSON.getInt( "id"):0;
                return true; // Loaded with data
            }
        }
        return false; // Failed to load data
    }

    public void render(){
        println( "Shape: id = " + orderIdInLayer );
        circle(
        random( 0, width ), // posCenterX
        random( 0, height ), // poxCenterY
        random( 0, ( width + height )/4) // Radius
        );
    }
} // end of Shape class
