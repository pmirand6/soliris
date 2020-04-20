/**
* DevExtreme (ui/hierarchical_collection/ui.hierarchical_collection_widget.d.ts)
* Version: 19.2.7
* Build date: Thu Mar 26 2020
*
* Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
* Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
*/
import CollectionWidget, {
    CollectionWidgetOptions
} from '../collection/ui.collection_widget.base';

/** Warning! This type is used for internal purposes. Do not import it directly. */
export interface HierarchicalCollectionWidgetOptions<T = HierarchicalCollectionWidget> extends CollectionWidgetOptions<T> {
    /**
     * @docid HierarchicalCollectionWidgetOptions.disabledExpr
     * @type string|function
     * @default 'disabled'
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    disabledExpr?: string | Function;
    /**
     * @docid HierarchicalCollectionWidgetOptions.displayExpr
     * @type string|function(item)
     * @default 'text'
     * @type_function_param1 item:object
     * @type_function_return string
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    displayExpr?: string | ((item: any) => string);
    /**
     * @docid HierarchicalCollectionWidgetOptions.focusStateEnabled
     * @type boolean
     * @default true [for](desktop)
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    focusStateEnabled?: boolean;
    /**
     * @docid HierarchicalCollectionWidgetOptions.hoverStateEnabled
     * @type boolean
     * @default true
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    hoverStateEnabled?: boolean;
    /**
     * @docid HierarchicalCollectionWidgetOptions.itemsExpr
     * @type string|function
     * @default 'items'
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    itemsExpr?: string | Function;
    /**
     * @docid HierarchicalCollectionWidgetOptions.keyExpr
     * @type string|function
     * @default 'id'
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    keyExpr?: string | Function;
    /**
     * @docid HierarchicalCollectionWidgetOptions.selectedExpr
     * @type string|function
     * @default 'selected'
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    selectedExpr?: string | Function;
}
/** Warning! This type is used for internal purposes. Do not import it directly. */

export default class HierarchicalCollectionWidget extends CollectionWidget {
    constructor(element: Element, options?: HierarchicalCollectionWidgetOptions)
    constructor(element: JQuery, options?: HierarchicalCollectionWidgetOptions)
}