set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.2789, <2> 39.0437, <3> 13.0381, <4> 4.6141, <5> 4.5375, <6> 32.1345, <7> 37.0485, <8> 21.3201, <9> 25.0959, <10> 31.9215, <11> 1.1325, <12> 20.4824, <13> 21.0289, <14> 16.3258, <15> 35.5529, <16> 32.7581, <17> 42.6055, <18> 47.147, <19> 15.675, <20> 15.9285;
param workload[JOB] := <1> 4.1568, <2> 6.2485, <3> 3.6108, <4> 2.148, <5> 2.1301, <6> 5.6687, <7> 6.0867, <8> 4.6174, <9> 5.0096, <10> 5.6499, <11> 1.0642, <12> 4.5257, <13> 4.5857, <14> 4.0405, <15> 5.9626, <16> 5.7235, <17> 6.5273, <18> 6.8664, <19> 3.9592, <20> 3.9911;
param capacity[MACHINE] := <1> 13.2247, <2> 13.2247, <3> 13.2247, <4> 13.2247, <5> 13.2247, <6> 13.2247, <7> 13.2247;

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
