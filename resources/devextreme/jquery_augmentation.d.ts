/**
* DevExtreme (jquery_augmentation.d.ts)
* Version: 19.2.7
* Build date: Thu Mar 26 2020
*
* Copyright (c) 2012 - 2020 Developer Express Inc. ALL RIGHTS RESERVED
* Read about DevExtreme licensing here: https://js.devexpress.com/Licensing/
*/
declare global {
    interface JQuery { }
    interface JQueryPromise<T> { }
    interface JQueryCallback { }
    interface JQueryEventObject {
        cancel?: boolean;
    }
    interface PromiseLike<T> { }
    interface Promise<T> {
        then<TResult1 = T, TResult2 = never>(
            onfulfilled?: ((value: T, extraParameters: T) => TResult1 | PromiseLike<TResult1>) | undefined | null,
            onrejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | undefined | null
        ): Promise<TResult1 | TResult2>;
    }
}

/** Warning! This type is used for internal purposes. Do not import it directly. */
export const { };
