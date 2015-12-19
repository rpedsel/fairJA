set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.0588, <2> 25.1098, <3> 36.4146, <4> 15.0173, <5> 30.7596, <6> 13.0062, <7> 23.8962, <8> 24.7155, <9> 18.9159, <10> 28.6793;
param workload[JOB] := <1> 531.7083, <2> 630.5021, <3> 1326.0231, <4> 225.5193, <5> 946.153, <6> 169.1612, <7> 571.0284, <8> 610.8559, <9> 357.8113, <10> 822.5022;
param capacity[MACHINE] := <1> 6191.2648, <2> 6191.2648, <3> 6191.2648;

var x[JM] binary;
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
