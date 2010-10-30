%module "RQREncoder"
%{
#include <qrencode.h>
%}
%include qrencode.h

%extend QRcode {
  VALUE modules() {
    VALUE result, row;
    unsigned char *p;
    int x, y, bit;
    result = rb_ary_new2($self->width);
    p = $self->data;
    for(y=0; y < $self->width; y++) {
      row = rb_ary_new2($self->width);
      for(x=0; x < $self->width; x++) {
        bit = *p & 1;
        rb_ary_push(row, bit == 0 ? Qfalse : Qtrue);
        p++;
      }
      rb_ary_push(result, row);
    }
    return result;
  }
} 
