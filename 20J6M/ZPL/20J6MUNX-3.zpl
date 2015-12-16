set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 4.7643, <2> 31.2819, <3> 45.4261, <4> 44.4501, <5> 40.535, <6> 48.5065, <7> 39.9712, <8> 3.4528, <9> 0.1694, <10> 9.7074, <11> 9.3278, <12> 6.2058, <13> 40.7676, <14> 32.2902, <15> 20.5152, <16> 2.8123, <17> 32.0365, <18> 13.4446, <19> 1.5439, <20> 44.8283;
param workload[JOB] := <1> 2.1827, <2> 5.593, <3> 6.7399, <4> 6.6671, <5> 6.3667, <6> 6.9647, <7> 6.3223, <8> 1.8582, <9> 0.4116, <10> 3.1157, <11> 3.0541, <12> 2.4911, <13> 6.385, <14> 5.6824, <15> 4.5294, <16> 1.677, <17> 5.6601, <18> 3.6667, <19> 1.2425, <20> 6.6954;
param capacity[MACHINE] := <1> 87.3056, <2> 87.3056, <3> 87.3056, <4> 87.3056, <5> 87.3056, <6> 87.3056;

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
