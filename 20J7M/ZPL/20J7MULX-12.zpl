set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 41.0853, <2> 29.8871, <3> 44.2209, <4> 47.4681, <5> 8.5094, <6> 21.7287, <7> 34.2238, <8> 25.8972, <9> 20.8064, <10> 33.5532, <11> 11.3676, <12> 18.5837, <13> 18.3982, <14> 9.9254, <15> 21.3989, <16> 15.3386, <17> 37.0186, <18> 22.924, <19> 29.599, <20> 46.1949;
param workload[JOB] := <1> 6.4098, <2> 5.4669, <3> 6.6499, <4> 6.8897, <5> 2.9171, <6> 4.6614, <7> 5.8501, <8> 5.0889, <9> 4.5614, <10> 5.7925, <11> 3.3716, <12> 4.3109, <13> 4.2893, <14> 3.1505, <15> 4.6259, <16> 3.9165, <17> 6.0843, <18> 4.7879, <19> 5.4405, <20> 6.7967;
param capacity[MACHINE] := <1> 14.4374, <2> 14.4374, <3> 14.4374, <4> 14.4374, <5> 14.4374, <6> 14.4374, <7> 14.4374;

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
