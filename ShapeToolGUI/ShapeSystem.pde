class ShapeSystem{
    ArrayList< Shape > shapeList; //OrderedList
    public ShapeSystem(){
        // TODO: Init something here
        shapeList = new ArrayList< Shape >();
    }
    public void render(){
        for ( Shape shapeObject : shapeList ) {
            shapeObject.render();
        }
    }

    private void addShape( Shape newShape ){
        if( newShape != null )
            shapeList.add( newShape );
    }

    public void removeLastShape(){
        if ( shapeList.size() > 0 )
            shapeList.remove( shapeList.size() - 1 );
    }
    
    public void removeAllShapes(){
        if ( shapeList.size() > 0 )
            shapeList.clear();
    }

    public void reassignIdtoAllShapes(){
        for ( int i = 0; i < shapeList.size(); i++){ 
            // Loop backward
            Shape theShape = shapeList.get( i );
            theShape.orderIdInLayer = i;
        }
    }

    public void reassignIdStartFromIndex( int startIndex ){
        for ( int i = startIndex; i < shapeList.size(); i++){
            Shape theShape = shapeList.get( i );
            theShape.orderIdInLayer = i;
        }
    }

    public void removeShapeById(int targetId){
        for ( int i = shapeList.size() - 1; i >= 0; i--){ 
            // Loop backward
            Shape theShape = shapeList.get( i );
            if ( theShape.orderIdInLayer == targetId ) {
                shapeList.remove( i );
            // Reassing new ordered id
            // to the remaining sublist
            reassignIdStartFromIndex( i );
            }
        }
    }
    
    public int count(){
        return shapeList.size();
    }

    public void createDummyBaseShape(int size){
        for ( int i = 0; i < size; i++ ){
            Shape newShape = new Shape( shapeList.size() );
            addShape( newShape );
        }
    }

    public void addCircle(float centerX, float centerY, float radius ){
        Circle newShape = new Circle( shapeList.size(),
        centerX, centerY, radius);
        addShape( newShape );
    }
        public void addCircle(){
        Circle newShape = new Circle( shapeList.size(),
       random( 0, width ),random( 0, height ),random( 0, (width + height)/4 ));
        addShape( newShape );
    }
    
    public void addRectangle(){
        Rectangle newShape = new Rectangle( shapeList.size(),
        random( 0, width ),random( 0, height ),random( 0, (width + height)/4 ),random( 0, (width + height)/4 ));
        addShape( newShape );
    }
    
    public void addRectangle(float topCornerX, float topCornerY, float recWidth, float recHeight ){
        Rectangle newShape = new Rectangle( shapeList.size(),
        topCornerX, topCornerY, recWidth, recHeight);
        addShape( newShape );
    }

    public void addTriangle(float posX1, float posY1, float posX2, float posY2,float posX3, float posY3 ){
        Triangle newShape = new Triangle( shapeList.size(),
        posX1, posY1, posX2, posY2, posX3, posY3);
        addShape( newShape );
    }

    public void createDummyAnyShape(int size){
        int choiceLimit = 3;
        int option;
        for ( int i = 0; i < size; i++ ){
            Shape newShape = null;
            option = int( random( 0, choiceLimit ) );
            switch( option ){
            case 0:
                addCircle(
                random( 0, width ),
                random( 0, height ),
                random( 0, (width + height)/4 )
                );
                break;
            case 1:
                addRectangle(
                random( 0, width ),
                random( 0, height ),
                random( 0, (width + height)/4 ),
                random( 0, (width + height)/4 )
                );
                break;
            case 2:
                addTriangle(
                random( 0, width ),
                random( 0, height ),
                random( 0, width ),
                random( 0, height ),
                random( 0, width ),
                random( 0, height )
                );
                break;
            default:
                break;
            }
        }
    }


    private JSONArray toJSONArray(){
        JSONArray dataJSONArray = new JSONArray(); // [ ]
        JSONObject dataJSONObject; // { }
        Shape theShape;
        for ( int i = 0; i < shapeList.size(); i++) {
            theShape = shapeList.get( i );
            dataJSONObject = theShape.toJSONObject();
            dataJSONArray.setJSONObject( i, dataJSONObject );
        }
        return dataJSONArray;
    }

    public void doSaveJSONArray(String filenameWithNoExtension){
        JSONArray dataJSONArray = toJSONArray();
        saveJSONArray( dataJSONArray, "data/" + filenameWithNoExtension + ".json" );
    }

    public void doLoadJSONArray(String filenameWithNoExtension){
        removeAllShapes(); // Clear the scene first
        JSONArray dataJSONArray;
        dataJSONArray = loadJSONArray("data/" + filenameWithNoExtension + ".json");
        for (int i = 0; i < dataJSONArray.size(); i++){
            JSONObject theShapeJSON = dataJSONArray.getJSONObject(i);
            String shapeType = ( !theShapeJSON.isNull( "type") ) ?
            theShapeJSON.getString( "type" ) : "BASESHAPE";
            
            if ( shapeType.equals(Shape.SHAPETYPE) ){
                Shape newShape = new Shape( -1 );
                if ( newShape.fromJSONObject( theShapeJSON ) ){
                    addShape( newShape );
                }
            } else if ( shapeType.equals(Circle.SHAPETYPE) ){
                Circle newShape = new Circle( -1, 0, 0, 0 );
                if ( newShape.fromJSONObject( theShapeJSON ) ){
                    addShape( newShape );
                }
            } else if ( shapeType.equals(Rectangle.SHAPETYPE) ){
                Rectangle newShape = new Rectangle( -1, 0, 0, 0, 0 );
                if ( newShape.fromJSONObject( theShapeJSON ) ){
                    addShape( newShape );
                }
            } else if ( shapeType.equals(Triangle.SHAPETYPE) )
            {
                Triangle newShape = new Triangle( -1, 0, 0, 0, 0, 0, 0 );
                if ( newShape.fromJSONObject( theShapeJSON ) ){
                    addShape( newShape );
                }
            }
        }
        reassignIdtoAllShapes(); // Make sure id is sequenced correctly
    }


}// End of ShapeSystem
