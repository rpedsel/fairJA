set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.8426, <2> 16.6268, <3> 46.6257, <4> 49.2711, <5> 6.4843, <6> 23.0392, <7> 37.8424, <8> 29.6646, <9> 39.443, <10> 15.9932, <11> 10.6429, <12> 1.1928, <13> 25.2696, <14> 27.0802, <15> 31.0037, <16> 42.6078, <17> 43.9447, <18> 33.5843, <19> 44.3159, <20> 45.6342;
param workload[JOB] := <1> 5.8174, <2> 4.0776, <3> 6.8283, <4> 7.0193, <5> 2.5464, <6> 4.7999, <7> 6.1516, <8> 5.4465, <9> 6.2804, <10> 3.9991, <11> 3.2623, <12> 1.0922, <13> 5.0269, <14> 5.2039, <15> 5.5681, <16> 6.5275, <17> 6.6291, <18> 5.7952, <19> 6.657, <20> 6.7553;
param capacity[MACHINE] := <1> 15.0691, <2> 15.0691, <3> 15.0691, <4> 15.0691, <5> 15.0691, <6> 15.0691, <7> 15.0691;

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
