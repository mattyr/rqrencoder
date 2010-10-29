%module RQREncoder
%{
#include "win2ansi.h"
#include "QR_Encode.h"
%}
%include win2ansi.h
%include QR_Encode.h

%extend CQR_Encode {
VALUE results()
{
  VALUE result = rb_ary_new2($self->m_nSymbleSize);
  size_t ii = 0;
  for (; ii < (size_t)$self->m_nSymbleSize; ++ii) {
    VALUE innerAry = rb_ary_new2($self->m_nSymbleSize);
    rb_ary_push(result, innerAry);
    size_t jj = 0;
    for (; jj < (size_t)$self->m_nSymbleSize; ++jj) {
     rb_ary_push(innerAry, $self->m_byModuleData[ii][jj] ? Qtrue : Qfalse);
    }
  }
  return result;
}
}
