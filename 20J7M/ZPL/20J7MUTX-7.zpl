set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.5213, <2> 30.984, <3> 20.2746, <4> 29.8605, <5> 48.2639, <6> 25.0424, <7> 10.3085, <8> 46.5191, <9> 39.6937, <10> 45.2468, <11> 4.9879, <12> 19.6218, <13> 42.548, <14> 18.2642, <15> 4.0469, <16> 16.2859, <17> 9.8248, <18> 49.2115, <19> 7.2637, <20> 30.3532;
param workload[JOB] := <1> 3.3943, <2> 5.5663, <3> 4.5027, <4> 5.4645, <5> 6.9472, <6> 5.0042, <7> 3.2107, <8> 6.8205, <9> 6.3003, <10> 6.7266, <11> 2.2334, <12> 4.4297, <13> 6.5229, <14> 4.2737, <15> 2.0117, <16> 4.0356, <17> 3.1345, <18> 7.0151, <19> 2.6951, <20> 5.5094;
param capacity[MACHINE] := <1> 10.2641, <2> 10.2641, <3> 10.2641, <4> 10.2641, <5> 10.2641, <6> 10.2641, <7> 10.2641;

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
