set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.3864, <2> 31.0137, <3> 18.8559, <4> 29.1876, <5> 31.491, <6> 22.4572, <7> 13.465, <8> 25.424, <9> 28.3101, <10> 26.7031, <11> 23.8907, <12> 24.9321, <13> 26.9656, <14> 18.8357, <15> 22.5358, <16> 21.6257, <17> 29.2431, <18> 19.0937, <19> 27.7051, <20> 24.7999;
param workload[JOB] := <1> 594.6965, <2> 961.8496, <3> 355.545, <4> 851.916, <5> 991.6831, <6> 504.3258, <7> 181.3062, <8> 646.3798, <9> 801.4618, <10> 713.0555, <11> 570.7655, <12> 621.6096, <13> 727.1436, <14> 354.7836, <15> 507.8623, <16> 467.6709, <17> 855.1589, <18> 364.5694, <19> 767.5726, <20> 615.035;
param capacity[MACHINE] := <1> 1779.1987, <2> 1779.1987, <3> 1779.1987, <4> 1779.1987, <5> 1779.1987, <6> 1779.1987, <7> 1779.1987;

var x[JM];
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
