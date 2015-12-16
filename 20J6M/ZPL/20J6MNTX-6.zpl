set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.9136, <2> 33.2702, <3> 26.1231, <4> 25.841, <5> 28.4786, <6> 25.0737, <7> 23.6321, <8> 15.2766, <9> 27.6942, <10> 33.1113, <11> 31.7821, <12> 25.6076, <13> 33.602, <14> 19.7454, <15> 25.082, <16> 22.4494, <17> 23.5364, <18> 21.9597, <19> 26.6905, <20> 35.0316;
param workload[JOB] := <1> 5.2833, <2> 5.768, <3> 5.1111, <4> 5.0834, <5> 5.3365, <6> 5.0074, <7> 4.8613, <8> 3.9085, <9> 5.2625, <10> 5.7542, <11> 5.6376, <12> 5.0604, <13> 5.7967, <14> 4.4436, <15> 5.0082, <16> 4.7381, <17> 4.8514, <18> 4.6861, <19> 5.1663, <20> 5.9187;
param capacity[MACHINE] := <1> 12.8354, <2> 12.8354, <3> 12.8354, <4> 12.8354, <5> 12.8354, <6> 12.8354;

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
