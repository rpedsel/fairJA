set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.081, <2> 12.1238, <3> 23.5264, <4> 27.9446, <5> 28.1827, <6> 26.5871, <7> 33.8272, <8> 18.4501, <9> 25.0528, <10> 28.7719;
param workload[JOB] := <1> 5.2992, <2> 3.4819, <3> 4.8504, <4> 5.2863, <5> 5.3087, <6> 5.1563, <7> 5.8161, <8> 4.2954, <9> 5.0053, <10> 5.3639;
param capacity[MACHINE] := <1> 16.6212, <2> 16.6212, <3> 16.6212;

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
