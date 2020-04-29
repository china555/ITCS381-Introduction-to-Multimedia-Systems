class Circle extends Shape{
    public static final String SHAPETYPE = "CIRCLESHAPE";
    float x, y, radius;
    public Circle( int orderIdInLayer, float centerX, float centerY, float radius ){
        super( orderIdInLayer );
        x = centerX;
        y = centerY;
        this.radius = radius;
        // There is no polymorphism for fields in Java.
        super.shapeType = Circle.SHAPETYPE;
    }
    @Override
    public void render(){ 
        // Cheat it this way
        // since we have not lecture line rasterization yet
        circle( x, y, radius );
    }


    @Override
    public JSONObject toJSONObject( ){
        JSONObject theShapeJSON = new JSONObject();
        theShapeJSON.setInt( "id", orderIdInLayer );
        theShapeJSON.setString( "type", shapeType );
        theShapeJSON.setFloat( "x", x );
        theShapeJSON.setFloat( "y", y );
        theShapeJSON.setFloat( "radius", radius );
        return theShapeJSON;
    }

    @Override
    public boolean fromJSONObject( JSONObject dataJSON ){
        if (dataJSON != null){
            String dataType = ( !dataJSON.isNull( "type") ) ?
            dataJSON.getString( "type" ) : "";
            if( dataType.equals( this.shapeType ) ){
                orderIdInLayer = ( !dataJSON.isNull( "id") ) ? dataJSON.getInt( "id" ) : 0;
                x = ( !dataJSON.isNull( "x") ) ? dataJSON.getFloat( "x" ) : 0;
                y = ( !dataJSON.isNull( "y") ) ? dataJSON.getFloat( "y" ) : 0;
                radius = ( !dataJSON.isNull( "radius") ) ? dataJSON.getFloat( "radius" ) : 0;
                return true; // Loaded with data
            }
        }
        return false; // Failed to load data
    }
}