set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.3041, <2> 15.5335, <3> 22.6241, <4> 25.8076, <5> 27.8701, <6> 25.7391, <7> 27.942, <8> 30.0897, <9> 26.5173, <10> 26.3973, <11> 21.4197, <12> 22.4056, <13> 21.6956, <14> 31.6282, <15> 28.9372, <16> 19.8938, <17> 34.7482, <18> 24.1291, <19> 26.4882, <20> 32.0732;
param workload[JOB] := <1> 5.857, <2> 3.9413, <3> 4.7565, <4> 5.0801, <5> 5.2792, <6> 5.0734, <7> 5.286, <8> 5.4854, <9> 5.1495, <10> 5.1378, <11> 4.6281, <12> 4.7335, <13> 4.6579, <14> 5.6239, <15> 5.3793, <16> 4.4602, <17> 5.8948, <18> 4.9121, <19> 5.1467, <20> 5.6633;
param capacity[MACHINE] := <1> 10.9442, <2> 10.9442, <3> 10.9442, <4> 10.9442, <5> 10.9442, <6> 10.9442, <7> 10.9442;

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
