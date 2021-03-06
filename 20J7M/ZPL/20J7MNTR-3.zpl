set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.4124, <2> 20.4401, <3> 24.6714, <4> 26.4075, <5> 20.5502, <6> 27.048, <7> 27.3455, <8> 25.9485, <9> 28.5307, <10> 27.8641, <11> 22.5319, <12> 24.3751, <13> 34.5569, <14> 22.1324, <15> 23.4057, <16> 15.5087, <17> 24.7673, <18> 28.2622, <19> 33.6923, <20> 25.5113;
param workload[JOB] := <1> 25.4837, <2> 1.2876, <3> 3.0387, <4> 25.1017, <5> 34.0829, <6> 24.4411, <7> 42.2108, <8> 49.685, <9> 1.0976, <10> 4.4572, <11> 45.7708, <12> 32.7821, <13> 17.2277, <14> 26.8242, <15> 35.1622, <16> 48.0776, <17> 6.5876, <18> 8.3281, <19> 9.2873, <20> 47.8837;
param capacity[MACHINE] := <1> 52.3733, <2> 52.3733, <3> 52.3733, <4> 52.3733, <5> 52.3733, <6> 52.3733, <7> 52.3733;

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
