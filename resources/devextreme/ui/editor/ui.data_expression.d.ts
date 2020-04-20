/**
* DevExtreme (ui/editor/ui.data_expression.d.ts)
* Version: 19.2.7
* Build date: Thu Mar 26 2020
*
* Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
* Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
*/
import {
    dxElement
} from '../../core/element';

import {
    template
} from '../../core/templates/template';

import DataSource, {
    DataSourceOptions
} from '../../data/data_source';

import {
    CollectionWidgetItem
} from '../collection/ui.collection_widget.base';

/** Warning! This type is used for internal purposes. Do not import it directly. */
export interface DataExpressionMixinOptions<T = DataExpressionMixin> {
    /**
     * @docid DataExpressionMixinOptions.dataSource
     * @type string|Array<CollectionWidgetItem, object>|DataSource|DataSourceOptions
     * @default null
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    dataSource?: string | Array<CollectionWidgetItem | any> | DataSource | DataSourceOptions;
    /**
     * @docid DataExpressionMixinOptions.displayExpr
     * @type string|function(item)
     * @default undefined
     * @type_function_param1 item:object
     * @type_function_return string
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    displayExpr?: string | ((item: any) => string);
    /**
     * @docid DataExpressionMixinOptions.itemTemplate
     * @type template|function
     * @default "item"
     * @type_function_param1 itemData:object
     * @type_function_param2 itemIndex:number
     * @type_function_param3 itemElement:dxElement
     * @type_function_return string|Node|jQuery
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    itemTemplate?: template | ((itemData: any, itemIndex: number, itemElement: dxElement) => string | Element | JQuery);
    /**
     * @docid DataExpressionMixinOptions.items
     * @type Array<CollectionWidgetItem, object>
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    items?: Array<CollectionWidgetItem | any>;
    /**
     * @docid DataExpressionMixinOptions.value
     * @type any
     * @default null
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    value?: any;
    /**
     * @docid DataExpressionMixinOptions.valueExpr
     * @type string|function(item)
     * @default "this"
     * @type_function_param1 item:object
     * @type_function_return string|number|boolean
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    valueExpr?: string | ((item: any) => string | number | boolean);
}
/** Warning! This type is used for internal purposes. Do not import it directly. */

export default class DataExpressionMixin {
    constructor(options?: DataExpressionMixinOptions)
    getDataSource(): DataSource;
}
