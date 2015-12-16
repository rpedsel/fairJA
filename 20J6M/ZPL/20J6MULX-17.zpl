set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.5139, <2> 23.5375, <3> 33.1546, <4> 2.3474, <5> 48.6129, <6> 41.3689, <7> 28.2964, <8> 18.4108, <9> 27.5356, <10> 40.9925, <11> 8.9456, <12> 19.7335, <13> 39.4849, <14> 18.9395, <15> 21.461, <16> 19.2647, <17> 1.5342, <18> 29.7091, <19> 19.8731, <20> 17.7729;
param workload[JOB] := <1> 6.5203, <2> 4.8515, <3> 5.758, <4> 1.5321, <5> 6.9723, <6> 6.4319, <7> 5.3194, <8> 4.2908, <9> 5.2474, <10> 6.4025, <11> 2.9909, <12> 4.4422, <13> 6.2837, <14> 4.352, <15> 4.6326, <16> 4.3892, <17> 1.2386, <18> 5.4506, <19> 4.4579, <20> 4.2158;
param capacity[MACHINE] := <1> 15.9633, <2> 15.9633, <3> 15.9633, <4> 15.9633, <5> 15.9633, <6> 15.9633;

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
