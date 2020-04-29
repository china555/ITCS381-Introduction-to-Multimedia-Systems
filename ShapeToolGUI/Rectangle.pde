class Rectangle extends Shape{
    public static final String SHAPETYPE = "RECTANGLESHAPE";
    float x, y, recWidth, recHeight;
    public Rectangle( int orderIdInLayer, float topCornerX, float topCornerY, float recWidth, float recHeight){
        super( orderIdInLayer );
        x = topCornerX;
        y = topCornerY;
        this.recWidth = recWidth;
        this.recHeight = recHeight;
        super.shapeType = Rectangle.SHAPETYPE;
    }

    @Override
    public void render(){
        rect( x, y, recWidth, recWidth );
    }

    @Override
    public JSONObject toJSONObject( ){
        JSONObject theShapeJSON = new JSONObject();
        theShapeJSON.setInt( "id", orderIdInLayer );
        theShapeJSON.setString( "type", shapeType );
        theShapeJSON.setFloat( "x", x );
        theShapeJSON.setFloat( "y", y );
        theShapeJSON.setFloat( "width", recWidth );
        theShapeJSON.setFloat( "height", recHeight );
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
                recWidth = ( !dataJSON.isNull( "width") ) ? dataJSON.getFloat( "width" ) : 0;
                recHeight = ( !dataJSON.isNull( "height") ) ? dataJSON.getFloat( "height" ) : 0;
                return true;
            }
        }
        return false;
    }
}