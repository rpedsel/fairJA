set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.9322, <2> 22.5457, <3> 28.7943, <4> 17.6663, <5> 20.4761, <6> 19.289, <7> 16.8246, <8> 21.4194, <9> 15.1704, <10> 23.9397, <11> 29.7744, <12> 23.1832, <13> 21.9469, <14> 22.9954, <15> 13.8451, <16> 28.9247, <17> 18.8232, <18> 32.9484, <19> 18.5036, <20> 22.1146;
param workload[JOB] := <1> 44.4669, <2> 34.4445, <3> 33.8605, <4> 16.1506, <5> 11.3819, <6> 8.4807, <7> 26.2462, <8> 1.6246, <9> 1.4221, <10> 37.2104, <11> 19.9444, <12> 44.5366, <13> 15.5793, <14> 45.6872, <15> 40.6341, <16> 3.3809, <17> 38.8904, <18> 48.1265, <19> 8.7896, <20> 44.2062;
param capacity[MACHINE] := <1> 525.0636, <2> 525.0636, <3> 525.0636, <4> 525.0636, <5> 525.0636, <6> 525.0636;

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
