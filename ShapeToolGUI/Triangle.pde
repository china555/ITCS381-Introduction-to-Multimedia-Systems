class Triangle extends Shape{

    public static final String SHAPETYPE = "TRIANGLESHAPE";
    float x1, y1, x2, y2, x3, y3;


    public Triangle( int orderIdInLayer, float posX1, float posY1, float posX2, float posY2, float posX3, float posY3){
        super( orderIdInLayer );
        x1 = posX1;
        y1 = posY1;
        x2 = posX2;
        y2 = posY2;
        x3 = posX3;
        y3 = posY3;
        super.shapeType = Triangle.SHAPETYPE;
    }

    @Override
    public void render(){
        triangle( x1, y1, x2, y2, x3, y3 );
    }


    @Override
    public JSONObject toJSONObject( ){
        JSONObject theShapeJSON = new JSONObject();
        theShapeJSON.setInt( "id", orderIdInLayer );
        theShapeJSON.setString( "type", shapeType );
        theShapeJSON.setFloat( "x1", x1 ); theShapeJSON.setFloat( "y1", y1 );
        theShapeJSON.setFloat( "x2", x2 ); theShapeJSON.setFloat( "y2", y2 );
        theShapeJSON.setFloat( "x3", x3 ); theShapeJSON.setFloat( "y3", y3 );
        return theShapeJSON;
    }

    @Override
    public boolean fromJSONObject( JSONObject dataJSON ){
        if (dataJSON != null){
            String dataType = ( !dataJSON.isNull( "type") ) ?
            dataJSON.getString( "type" ) : "";
            if( dataType.equals( this.shapeType ) ){
                orderIdInLayer = ( !dataJSON.isNull( "id") ) ? dataJSON.getInt( "id" ) : 0;
                x1 = ( !dataJSON.isNull( "x1") ) ? dataJSON.getFloat( "x1" ) : 0;
                y1 = ( !dataJSON.isNull( "y1") ) ? dataJSON.getFloat( "y1" ) : 0;
                x2 = ( !dataJSON.isNull( "x2") ) ? dataJSON.getFloat( "x2" ) : 0;
                y2 = ( !dataJSON.isNull( "y2") ) ? dataJSON.getFloat( "y2" ) : 0;
                x3 = ( !dataJSON.isNull( "x3") ) ? dataJSON.getFloat( "x3" ) : 0;
                y3 = ( !dataJSON.isNull( "y3") ) ? dataJSON.getFloat( "y3" ) : 0;
                return true;
            }
        }
        return false;
    }
}