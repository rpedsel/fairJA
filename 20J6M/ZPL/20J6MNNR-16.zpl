set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.655, <2> 33.0008, <3> 17.1659, <4> 28.8231, <5> 22.562, <6> 30.0673, <7> 25.4594, <8> 15.8523, <9> 18.8064, <10> 20.7598, <11> 19.3586, <12> 31.6841, <13> 22.8854, <14> 27.6688, <15> 24.5812, <16> 24.2345, <17> 20.2457, <18> 24.5361, <19> 19.9744, <20> 18.7385;
param workload[JOB] := <1> 37.3241, <2> 16.7523, <3> 49.9958, <4> 12.6044, <5> 26.5045, <6> 43.5315, <7> 28.7972, <8> 10.9218, <9> 12.8424, <10> 49.3399, <11> 11.617, <12> 23.5017, <13> 29.0926, <14> 4.6542, <15> 18.5002, <16> 22.2117, <17> 23.734, <18> 43.876, <19> 13.5553, <20> 32.2676;
param capacity[MACHINE] := <1> 511.6242, <2> 511.6242, <3> 511.6242, <4> 511.6242, <5> 511.6242, <6> 511.6242;

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
