set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.4983, <2> 31.8556, <3> 25.3816, <4> 23.49, <5> 15.3992, <6> 31.8642, <7> 21.4191, <8> 28.3614, <9> 19.5067, <10> 16.7231, <11> 27.8922, <12> 22.9951, <13> 29.2811, <14> 27.0738, <15> 27.43, <16> 27.3907, <17> 21.3295, <18> 19.9453, <19> 27.758, <20> 16.421;
param workload[JOB] := <1> 37.2167, <2> 7.5169, <3> 46.924, <4> 12.8053, <5> 48.6369, <6> 17.602, <7> 31.6366, <8> 18.5647, <9> 14.6206, <10> 37.673, <11> 39.0868, <12> 38.4878, <13> 24.5483, <14> 48.56, <15> 33.2878, <16> 38.2823, <17> 43.6664, <18> 33.2594, <19> 18.449, <20> 18.8642;
param capacity[MACHINE] := <1> 87.0984, <2> 87.0984, <3> 87.0984, <4> 87.0984, <5> 87.0984, <6> 87.0984, <7> 87.0984;

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
