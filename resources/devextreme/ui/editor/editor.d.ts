/**
* DevExtreme (ui/editor/editor.d.ts)
* Version: 19.2.7
* Build date: Thu Mar 26 2020
*
* Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
* Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
*/
import '../../jquery_augmentation';

import {
    dxElement
} from '../../core/element';

import {
    event
} from '../../events';

import Widget, {
    WidgetOptions
} from '../widget/ui.widget';

/** Warning! This type is used for internal purposes. Do not import it directly. */
export interface EditorOptions<T = Editor> extends WidgetOptions<T> {
    /**
     * @docid EditorOptions.isValid
     * @type boolean
     * @default true
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    isValid?: boolean;
    /**
     * @docid EditorOptions.onValueChanged
     * @extends Action
     * @type function(e)
     * @type_function_param1 e:object
     * @type_function_param1_field4 value:object
     * @type_function_param1_field5 previousValue:object
     * @type_function_param1_field6 jQueryEvent:jQuery.Event:deprecated(event)
     * @type_function_param1_field7 event:event
     * @action
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    onValueChanged?: ((e: { component?: T, element?: dxElement, model?: any, value?: any, previousValue?: any, jQueryEvent?: JQueryEventObject, event?: event }) => any);
    /**
     * @docid EditorOptions.readOnly
     * @type boolean
     * @default false
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    readOnly?: boolean;
    /**
     * @docid EditorOptions.validationError
     * @type object
     * @ref
     * @default null
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    validationError?: any;
    /**
     * @docid EditorOptions.validationErrors
     * @type Array<object>
     * @default null
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    validationErrors?: Array<any>;
    /**
     * @docid EditorOptions.validationMessageMode
     * @type Enums.ValidationMessageMode
     * @default "auto"
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    validationMessageMode?: 'always' | 'auto';
    /**
     * @docid EditorOptions.validationStatus
     * @type Enums.ValidationStatus
     * @default "valid"
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    validationStatus?: 'valid' | 'invalid' | 'pending';
    /**
     * @docid EditorOptions.value
     * @type any
     * @default null
     * @fires EditorOptions.onValueChanged
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    value?: any;
}
/** Warning! This type is used for internal purposes. Do not import it directly. */
/** A base class for editors. */
export default class Editor extends Widget {
    constructor(element: Element, options?: EditorOptions)
    constructor(element: JQuery, options?: EditorOptions)
    /**
     * @docid EditorMethods.reset
     * @publicName reset()
     * @prevFileNamespace DevExpress.ui
     * @public
     */
    reset(): void;
}
