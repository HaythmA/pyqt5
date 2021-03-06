// qthreadpool.sip generated by MetaSIP
//
// This file is part of the QtCore Python extension module.
//
// Copyright (c) 2015 Riverbank Computing Limited <info@riverbankcomputing.com>
// 
// This file is part of PyQt5.
// 
// This file may be used under the terms of the GNU General Public License
// version 3.0 as published by the Free Software Foundation and appearing in
// the file LICENSE included in the packaging of this file.  Please review the
// following information to ensure the GNU General Public License version 3.0
// requirements will be met: http://www.gnu.org/copyleft/gpl.html.
// 
// If you do not wish to use this file under the terms of the GPL version 3.0
// then you may purchase a commercial license.  For more information contact
// info@riverbankcomputing.com.
// 
// This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
// WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.


class QThreadPool : QObject
{
%TypeHeaderCode
#include <qthreadpool.h>
%End

public:
    QThreadPool(QObject *parent /TransferThis/ = 0);
    virtual ~QThreadPool();
    static QThreadPool *globalInstance() /KeepReference/;
    void start(QRunnable *runnable /GetWrapper/, int priority = 0) /ReleaseGIL/;
%MethodCode
        // We have to handle the object ownership manually.
        if (a0->autoDelete())
            sipTransferTo(a0Wrapper, sipSelf);
        
        Py_BEGIN_ALLOW_THREADS
        sipCpp->start(a0, a1);
        Py_END_ALLOW_THREADS
%End

    bool tryStart(QRunnable *runnable /GetWrapper/) /ReleaseGIL/;
%MethodCode
        // We have to handle the object ownership manually.
        if (a0->autoDelete())
            sipTransferTo(a0Wrapper, sipSelf);
        
        Py_BEGIN_ALLOW_THREADS
        sipRes = sipCpp->tryStart(a0);
        Py_END_ALLOW_THREADS
%End

    int expiryTimeout() const;
    void setExpiryTimeout(int expiryTimeout);
    int maxThreadCount() const;
    void setMaxThreadCount(int maxThreadCount);
    int activeThreadCount() const;
    void reserveThread();
    void releaseThread();
    bool waitForDone(int msecs = -1) /ReleaseGIL/;
%If (Qt_5_2_0 -)
    void clear();
%End
%If (Qt_5_5_0 -)
    void cancel(QRunnable *runnable);
%End
};
