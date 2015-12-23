set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.8988, <2> 21.8345, <3> 23.9612, <4> 27.9128, <5> 32.7568, <6> 26.3098, <7> 21.0385, <8> 20.9533, <9> 29.2546, <10> 39.0852, <11> 23.5166, <12> 20.1318, <13> 30.0274, <14> 32.3418, <15> 27.6522, <16> 19.0669, <17> 33.612, <18> 16.5188, <19> 25.5201, <20> 28.3464;
param workload[JOB] := <1> 5.468, <2> 4.6727, <3> 4.895, <4> 5.2833, <5> 5.7234, <6> 5.1293, <7> 4.5868, <8> 4.5775, <9> 5.4088, <10> 6.2518, <11> 4.8494, <12> 4.4868, <13> 5.4797, <14> 5.687, <15> 5.2585, <16> 4.3666, <17> 5.7976, <18> 4.0643, <19> 5.0517, <20> 5.3241;
param capacity[MACHINE] := <1> 14.6232, <2> 14.6232, <3> 14.6232, <4> 14.6232, <5> 14.6232, <6> 14.6232, <7> 14.6232;

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
