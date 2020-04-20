/**
* DevExtreme (ui/gallery.d.ts)
* Version: 19.2.7
* Build date: Thu Mar 26 2020
*
* Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
* Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
*/
import '../jquery_augmentation';

import DataSource, {
    DataSourceOptions
} from '../data/data_source';

import CollectionWidget, {
    CollectionWidgetItem,
    CollectionWidgetOptions
} from './collection/ui.collection_widget.base';

/** Warning! This type is used for internal purposes. Do not import it directly. */
export interface dxGalleryOptions extends CollectionWidgetOptions<dxGallery> {
    /**
     * @docid dxGalleryOptions.animationDuration
     * @type number
     * @default 400
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    animationDuration?: number;
    /**
     * @docid dxGalleryOptions.animationEnabled
     * @type boolean
     * @default true
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    animationEnabled?: boolean;
    /**
     * @docid dxGalleryOptions.dataSource
     * @type string|Array<string,dxGalleryItem,object>|DataSource|DataSourceOptions
     * @default null
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    dataSource?: string | Array<string | dxGalleryItem | any> | DataSource | DataSourceOptions;
    /**
     * @docid dxGalleryOptions.focusStateEnabled
     * @type boolean
     * @default true [for](desktop)
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    focusStateEnabled?: boolean;
    /**
     * @docid dxGalleryOptions.indicatorEnabled
     * @type boolean
     * @default true
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    indicatorEnabled?: boolean;
    /**
     * @docid dxGalleryOptions.initialItemWidth
     * @type number
     * @default undefined
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    initialItemWidth?: number;
    /**
     * @docid dxGalleryOptions.items
     * @type Array<string, dxGalleryItem, object>
     * @fires dxGalleryOptions.onOptionChanged
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    items?: Array<string | dxGalleryItem | any>;
    /**
     * @docid dxGalleryOptions.loop
     * @type boolean
     * @default false
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    loop?: boolean;
    /**
     * @docid dxGalleryOptions.noDataText
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    noDataText?: string;
    /**
     * @docid dxGalleryOptions.selectedIndex
     * @type number
     * @default 0
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    selectedIndex?: number;
    /**
     * @docid dxGalleryOptions.showIndicator
     * @type boolean
     * @default true
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    showIndicator?: boolean;
    /**
     * @docid dxGalleryOptions.showNavButtons
     * @type boolean
     * @default false
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    showNavButtons?: boolean;
    /**
     * @docid dxGalleryOptions.slideshowDelay
     * @type number
     * @default 0
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    slideshowDelay?: number;
    /**
     * @docid dxGalleryOptions.stretchImages
     * @type boolean
     * @default false
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    stretchImages?: boolean;
    /**
     * @docid dxGalleryOptions.swipeEnabled
     * @type boolean
     * @default true
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    swipeEnabled?: boolean;
    /**
     * @docid dxGalleryOptions.wrapAround
     * @type boolean
     * @default false
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    wrapAround?: boolean;
}
/** The Gallery is a widget that displays a collection of images in a carousel. The widget is supplied with various navigation controls that allow a user to switch between images. */
export default class dxGallery extends CollectionWidget {
    constructor(element: Element, options?: dxGalleryOptions)
    constructor(element: JQuery, options?: dxGalleryOptions)
    /**
     * @docid dxGalleryMethods.goToItem
     * @publicName goToItem(itemIndex, animation)
     * @param1 itemIndex:numeric
     * @param2 animation:boolean
     * @return Promise<void>
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    goToItem(itemIndex: number, animation: boolean): Promise<void> & JQueryPromise<void>;
    /**
     * @docid dxGalleryMethods.nextItem
     * @publicName nextItem(animation)
     * @param1 animation:boolean
     * @return Promise<void>
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    nextItem(animation: boolean): Promise<void> & JQueryPromise<void>;
    /**
     * @docid dxGalleryMethods.prevItem
     * @publicName prevItem(animation)
     * @param1 animation:boolean
     * @return Promise<void>
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    prevItem(animation: boolean): Promise<void> & JQueryPromise<void>;
}

/** Warning! This type is used for internal purposes. Do not import it directly. */
export interface dxGalleryItem extends CollectionWidgetItem {
    /**
     * @docid dxGalleryItem.imageAlt
     * @type String
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    imageAlt?: string;
    /**
     * @docid dxGalleryItem.imageSrc
     * @type String
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    imageSrc?: string;
}

declare global {
interface JQuery {
    dxGallery(): JQuery;
    dxGallery(options: "instance"): dxGallery;
    dxGallery(options: string): any;
    dxGallery(options: string, ...params: any[]): any;
    dxGallery(options: dxGalleryOptions): JQuery;
}
}
/** Warning! This type is used for internal purposes. Do not import it directly. */
export type Options = dxGalleryOptions;

/** @deprecated use Options instead */
/** Warning! This type is used for internal purposes. Do not import it directly. */
export type IOptions = dxGalleryOptions;