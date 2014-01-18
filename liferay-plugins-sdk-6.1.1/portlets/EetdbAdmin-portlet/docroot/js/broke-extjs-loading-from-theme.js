var nativeDateContructor = Date;

Date = function (Date) {
    return function () {
        return null;
    }
}(Date);