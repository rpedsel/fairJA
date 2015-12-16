set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.4933, <2> 15.0516, <3> 16.2598, <4> 1.3584, <5> 25.9989, <6> 25.8666, <7> 15.532, <8> 33.9741, <9> 12.9345, <10> 19.143, <11> 2.4057, <12> 33.586, <13> 0.5038, <14> 22.7046, <15> 48.1663, <16> 45.7413, <17> 15.2397, <18> 3.5538, <19> 22.8868, <20> 13.7888;
param workload[JOB] := <1> 3.0811, <2> 3.8796, <3> 4.0323, <4> 1.1655, <5> 5.0989, <6> 5.0859, <7> 3.9411, <8> 5.8287, <9> 3.5965, <10> 4.3753, <11> 1.551, <12> 5.7953, <13> 0.7098, <14> 4.7649, <15> 6.9402, <16> 6.7632, <17> 3.9038, <18> 1.8852, <19> 4.784, <20> 3.7133;
param capacity[MACHINE] := <1> 13.4826, <2> 13.4826, <3> 13.4826, <4> 13.4826, <5> 13.4826, <6> 13.4826;

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
