set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.339, <2> 7.9465, <3> 48.3943, <4> 19.8923, <5> 22.0978, <6> 44.3642, <7> 15.5395, <8> 4.7431, <9> 27.2704, <10> 39.8452;
param workload[JOB] := <1> 6.8073, <2> 2.819, <3> 6.9566, <4> 4.4601, <5> 4.7008, <6> 6.6606, <7> 3.942, <8> 2.1779, <9> 5.2221, <10> 6.3123;
param capacity[MACHINE] := <1> 50.0587, <2> 50.0587, <3> 50.0587;

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
